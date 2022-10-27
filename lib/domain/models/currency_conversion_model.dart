import 'package:divisas/screens/utils/time_convert.dart';

class CurrencyConversionModel {
  final int converted;
  final int initialAmout;
  final String ask;
  final String bid;
  final String exchange;
  final String time;
  final String symbol;
  final String id;

  CurrencyConversionModel({
    required this.converted,
    required this.initialAmout,
    required this.ask,
    required this.bid,
    required this.exchange,
    required this.time,
    required this.symbol,
    required this.id,
  });

  factory CurrencyConversionModel.fromJson(Map<String, dynamic> map) {
    return CurrencyConversionModel(
        converted: map["converted"] ?? 0,
        initialAmout: map["initialAmount"] as int? ?? 100,
        ask: (map["last"]["ask"] as double? ?? 0.0).toString(),
        bid: (map["last"]["bid"] as double? ?? 0.0).toString(),
        exchange: (map["last"]["exchange"] as int? ?? 0.0).toString(),
        time: timeFormat(map["last"]["timestamp"]),
        symbol: map["symbol"] as String? ?? "USD/COP",
        id: map["request_id"] as String? ?? "0");
  }
}

CurrencyConversionModel singleEmpty = CurrencyConversionModel(
    converted: 0,
    initialAmout: 1,
    ask: '*****.***',
    bid: '*****.*',
    exchange: '0.0',
    time: timeFormat(null),
    symbol: "USD/COP",
    id: "0");
