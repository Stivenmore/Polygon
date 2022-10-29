import 'package:dio/dio.dart';
import 'package:divisas/data/api/api_manager.dart';

const baseUrl = "api.polygon.io";
const apikey = "uR238psV2U4qkQnRc_ouJ4TXiZB8UGJC";

ApiManager apiManager = ApiManager(
    client: Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    )),
    host: baseUrl);

ApiManager apiManagerMock1 = ApiManager(
    client: Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    )),
    host: baseUrl,
    mockfile: "realtime_current_mock.json");

ApiManager apiManagerMock2 = ApiManager(
    client: Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    )),
    host: baseUrl,
    mockfile: "aggregates_bar.json");
