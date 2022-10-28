import 'package:divisas/screens/utils/time_convert.dart';

class AggregateBarEntity {
  final int resultsCount;
  final int queryCount;
  final String status;
  final String ticker;
  final String id;
  final List<AggregateBarResult> result;

  AggregateBarEntity(
      {required this.resultsCount,
      required this.id,
      required this.queryCount,
      required this.status,
      required this.ticker,
      required this.result});

  factory AggregateBarEntity.fromJson(Map<String, dynamic> map) {
    return AggregateBarEntity(
        ticker: map["ticker"] as String? ?? "USD/COP",
        id: map["request_id"] as String? ?? "0",
        queryCount: map["queryCount"] as int? ?? 0,
        status: map["status"] as String? ?? "Fail",
        resultsCount: map["resultsCount"] as int? ?? 0,
        result: AggregateBarResult.fromList(map["results"]));
  }
}

class AggregateBarResult {
  final dynamic v;
  final dynamic vw;
  final dynamic o;
  final dynamic c;
  final dynamic h;
  final dynamic l;
  final dynamic t;
  final dynamic n;
  AggregateBarResult(
      {required this.v,
      required this.vw,
      required this.o,
      required this.c,
      required this.h,
      required this.l,
      required this.t,
      required this.n});

  factory AggregateBarResult.fromJson(Map<String, dynamic> map) {
    return AggregateBarResult(
      v: map["v"] ?? 0,
      vw: map["vw"] ?? 0.0,
      o: map["o"] ?? 0.0,
      c: map["c"] ?? 0.0,
      h: map["h"] ?? 0.0,
      l: map["l"] ?? 0.0,
      t: timeFormatGrafic(map["t"]),
      n: map["n"] ?? 0,
    );
  }

  static List<AggregateBarResult> fromList(List list) {
    return list.map((e) => AggregateBarResult.fromJson(e)).toList();
  }
}

AggregateBarEntity singleEmpty = AggregateBarEntity(
    resultsCount: 0,
    id: "1",
    queryCount: 0,
    status: "None",
    ticker: "USD/COP",
    result: []);
