import 'package:divisas/data/services/result.dart';

abstract class PolygonContract {
  Future<Result<dynamic, BackendError>> realTimeCurrencyConversion(
      {required String from, required String to, required String precision});
}
