import 'package:divisas/device/db/month/db_model_month.dart';
import 'package:divisas/device/db/oneyear/db_model_oneyear.dart';
import 'package:divisas/device/db/today/db_model_today.dart';
import 'package:divisas/device/db/twoyear/db_model_twoyear.dart';
import 'package:divisas/device/db/week/db_model_week.dart';
import 'package:divisas/domain/entities/aggregates_bar_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

configurationLocalSave(
    int currentSelect, AggregateBarEntity model, List map) async {
  switch (currentSelect) {
    case 0:
      final box = await Hive.openBox<DBModelTwoYear>('dbmodeltwoyear');
      final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
      DBModelTwoYear? modelWeek = box.get(boxkeylast);
      if (model.result[0].t != modelWeek?.result[0].t) {
        await box.add(DBModelTwoYear(
            resultsCount: model.resultsCount,
            id: model.id,
            queryCount: model.queryCount,
            result: map,
            status: model.status,
            ticker: model.ticker));
      }
      break;
    case 1:
      final box = await Hive.openBox<DBModelOneYear>('dbmodeloneyear');
      final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
      DBModelOneYear? modelWeek = box.get(boxkeylast);
      if (model.result[0].t != modelWeek?.result[0].t) {
        await box.add(DBModelOneYear(
            resultsCount: model.resultsCount,
            id: model.id,
            queryCount: model.queryCount,
            result: map,
            status: model.status,
            ticker: model.ticker));
      }
      break;
    case 2:
      final box = await Hive.openBox<DBModelMonth>('dbmodelmonth');
      final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
      DBModelMonth? modelWeek = box.get(boxkeylast);
      if (model.result[0].t != modelWeek?.result[0].t) {
        await box.add(DBModelMonth(
            resultsCount: model.resultsCount,
            id: model.id,
            queryCount: model.queryCount,
            result: map,
            status: model.status,
            ticker: model.ticker));
      }
      break;
    case 3:
      final box = await Hive.openBox<DBModelWeek>('dbmodelweek');
      final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
      DBModelWeek? modelWeek = box.get(boxkeylast);
      if (model.result[0].t != modelWeek?.result[0].t) {
        await box.add(DBModelWeek(
            resultsCount: model.resultsCount,
            id: model.id,
            queryCount: model.queryCount,
            result: map,
            status: model.status,
            ticker: model.ticker));
      }
      break;
    case 4:
      final box = await Hive.openBox<DBModelToday>('dbmodeltoday');
      final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
      DBModelToday? modelWeek = box.get(boxkeylast);
      if (model.result[0].t != modelWeek?.result[0].t) {
        await box.add(DBModelToday(
            resultsCount: model.resultsCount,
            id: model.id,
            queryCount: model.queryCount,
            result: map,
            status: model.status,
            ticker: model.ticker));
      }

      break;
  }
}
