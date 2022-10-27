import 'package:dio/dio.dart';
import 'package:divisas/data/api/api_manager.dart';
import 'package:divisas/data/contract/polygon_contract.dart';
import 'package:divisas/data/env/env.dart';
import 'package:divisas/data/services/error_handler.dart';
import 'package:divisas/data/services/result.dart';

class PolygonRestDataSource implements PolygonContract {
  final ApiManager _apiManager;

  PolygonRestDataSource(ApiManager apiManager)
      : _apiManager = apiManager,
        super();

  @override
  Future<Result<dynamic, BackendError>> realTimeCurrencyConversion(
      {required String from,
      required String to,
      required String precision}) async {
    try {
      Result<dynamic, BackendError> response = await _apiManager.makeRequest(
          method: Method.get,
          path: "/v1/conversion/$from/$to",
          queryParameters: {"precision": precision, "apiKey": apikey});

      return response.when(
        fail: (fail) => Fail(fail),
        success: (success) => Success(success),
      );
    } catch (e) {
      ErrorHandler(e);
      throw Exception(e);
    }
  }
}
