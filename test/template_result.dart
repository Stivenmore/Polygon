import 'package:divisas/domain/entities/aggregates_bar_entity.dart';
import 'package:divisas/domain/models/currency_conversion_model.dart';

const CurrencyConversionModel model = CurrencyConversionModel(
  ask: "4836.76",
  bid: "4833.26",
  converted: 483326,
  exchange: "48",
  time: "Oct.28th03:23 PM",
  initialAmout: 100,
  id: "82c971215161ba196e5c8f58ca9f1c99",
  symbol: "USD/COP",
);

const AggregateBarEntity model2 = AggregateBarEntity(
    resultsCount: 3,
    id: "fc4dd61a4afb70758518693d7099e2b8",
    queryCount: 120,
    status: "OK",
    ticker: "C:USDCOP",
    result: [
      AggregateBarResult(
          v: 1,
          vw: 4753.1526,
          o: 4753.1526,
          c: 4753.1526,
          h: 4753.1526,
          l: 4753.1526,
          t: "2022/10/28",
          n: 1),
      AggregateBarResult(
          v: 331,
          vw: 4779.6668,
          o: 4823.2,
          c: 4799.5,
          h: 4834.45,
          l: 4761.26,
          t: "2022/10/28",
          n: 331),
      AggregateBarResult(
          v: 391,
          vw: 4803.1317,
          o: 4799,
          c: 4808.18,
          h: 4814.26,
          l: 4793.35,
          t: "2022/10/28",
          n: 391),
    ]);
