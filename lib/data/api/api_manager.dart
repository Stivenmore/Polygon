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
    bool onlyPath = false,
    String? temporalHost,
  }) async {
    if (mockResponseFile != null && mockResponseFile == 1) {
      final response = await _getMockResponse(_mockfile!);
      return Result.success(response);
    } else if (mockResponseFile != null && mockResponseFile == 2) {
      return Result.fail(
        const BackendError(
          statusCode: 500,
          description: 'default',
          err: 'default',
        ),
      );
    } else if (mockResponseFile != null && mockResponseFile == 3) {
      return Result.fail(
        const BackendError(
          statusCode: 500,
          description: 'default',
          err: 'default',
        ),
      );
    } else if (mockResponseFile != null && mockResponseFile < 1) {
      return Result.fail(
        const BackendError(
          statusCode: 500,
          description: 'receiveTimeout',
          err: 'receiveTimeout',
        ),
      );
    }

    Map<String, dynamic> _headers = <String, dynamic>{};

    Uri uri = Uri.https(temporalHost ?? _host, path, queryParameters);

    if (onlyPath) {
      path = 'https://${temporalHost ?? _host}/$path';
    }

    final Response response;

    final Options options = Options(
      headers: _headers,
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
              statusCode: error.response?.statusCode ?? 500,
              description: error.message,
              err: 'sendTimeout',
            ),
          );
        default:
          return Result.fail(
            BackendError(
              statusCode: error.response?.statusCode ?? 500,
              description: error.message,
              err: 'default',
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
