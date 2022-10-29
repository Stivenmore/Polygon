import 'package:hive/hive.dart';

part 'db_model_week.g.dart';

@HiveType(typeId: 0)
class DBModelWeek extends HiveObject {
  @HiveField(0)
  final int resultsCount;
  @HiveField(1)
  final int queryCount;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String ticker;
  @HiveField(4)
  final String id;
  @HiveField(5)
  final List result;

  DBModelWeek(
      {required this.resultsCount,
      required this.id,
      required this.queryCount,
      required this.result,
      required this.status,
      required this.ticker});
}
