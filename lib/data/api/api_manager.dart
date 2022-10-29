import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:divisas/data/services/result.dart';

const String kAuthorizationHeader = 'Authorization';
const String kBearer = 'Bearer';

enum Method {
  get,
}

class ApiManager {
  final Dio _client;
  final String _host;
  final String? _mockfile;
  ApiManager({
    required Dio client,
    required String host,
    String? mockfile,
  })  : _client = client,
        _host = host,
        _mockfile = mockfile;
  Future<Result<dynamic, BackendError>> makeRequest({
    dynamic data,
    Map<String, dynamic>? headers,
    required Method method,
    int? mockResponseFile,
    required String path,
    Map<String, dynamic>? queryParameters,
    String? temporalHost,
  }) async {
    if (mockResponseFile != null && mockResponseFile == 1) {
      final response = await _getMockResponse(_mockfile!);
      try {
        return Result.success(response);
      } catch (e) {
        return Result.fail(
          const BackendError(
            statusCode: 500,
            description: 'error',
            err: 'error',
          ),
        );
      }
    } else if (mockResponseFile != null && mockResponseFile < 1) {
      return Result.fail(
        const BackendError(
          statusCode: 500,
          description: 'receiveTimeout',
          err: 'receiveTimeout',
        ),
      );
    }

    Map<String, dynamic> headers = <String, dynamic>{};

    Uri uri = Uri.https(temporalHost ?? _host, path, queryParameters);

    final Response response;

    final Options options = Options(
      headers: headers,
    );

    try {
      switch (method) {
        case Method.get:
          response = await _client.getUri(
            uri,
            options: options,
          );
          break;
      }
      return Result.success(response.data);
    } on DioError catch (error) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
          return Result.fail(
            BackendError(
              statusCode: error.response?.statusCode ?? 500,
              description: error.message,
              err: 'connectTimeout',
            ),
          );
        case DioErrorType.receiveTimeout:
          return Result.fail(
            BackendError(
              statusCode: error.response?.statusCode ?? 500,
              description: error.message,
              err: 'receiveTimeout',
            ),
          );
        case DioErrorType.sendTimeout:
          return Result.fail(
            BackendError(
              statusCode: error.response?.statusCode ?? 501,
              description: error.message,
              err: 'sendTimeout',
            ),
          );
        default:
          return Result.fail(
            BackendError(
              statusCode: error.response?.statusCode ?? 500,
              description: error.message,
              err: 'ConnectionFail',
            ),
          );
      }
    }
  }

  Future<Map<String, dynamic>> _getMockResponse(String filePath) =>
      Future.delayed(
        const Duration(seconds: 2),
        () async {
          final file = await rootBundle.loadString('assets/mock/$filePath');
          return jsonDecode(file);
        },
      );
}
