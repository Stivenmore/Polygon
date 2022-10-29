import 'package:hive/hive.dart';

part 'db_model_currency.g.dart';

@HiveType(typeId: 6)
class DBModelCurrency extends HiveObject {
  @HiveField(0)
  final int converted;
  @HiveField(1)
  final int initialAmout;
  @HiveField(2)
  final String ask;
  @HiveField(3)
  final String bid;
  @HiveField(4)
  final String exchange;
  @HiveField(5)
  final String time;
  @HiveField(6)
  final String symbol;
  @HiveField(7)
  final String id;

  DBModelCurrency(
      {required this.converted,
      required this.ask,
      required this.bid,
      required this.exchange,
      required this.id,
      required this.initialAmout,
      required this.symbol,
      required this.time});
}
