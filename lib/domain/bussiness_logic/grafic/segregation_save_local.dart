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
      await box.add(DBModelTwoYear(
          resultsCount: model.resultsCount,
          id: model.id,
          queryCount: model.queryCount,
          result: map,
          status: model.status,
          ticker: model.ticker));
      if (box.length > 1) await box.delete(box.keys.first);
      break;
    case 1:
      final box = await Hive.openBox<DBModelOneYear>('dbmodeloneyear');
      await box.add(DBModelOneYear(
          resultsCount: model.resultsCount,
          id: model.id,
          queryCount: model.queryCount,
          result: map,
          status: model.status,
          ticker: model.ticker));
      if (box.length > 1) await box.delete(box.keys.first);
      break;
    case 2:
      final box = await Hive.openBox<DBModelMonth>('dbmodelmonth');
      await box.add(DBModelMonth(
          resultsCount: model.resultsCount,
          id: model.id,
          queryCount: model.queryCount,
          result: map,
          status: model.status,
          ticker: model.ticker));
      if (box.length > 1) await box.delete(box.keys.first);
      break;
    case 3:
      final box = await Hive.openBox<DBModelWeek>('dbmodelweek');
      await box.add(DBModelWeek(
          resultsCount: model.resultsCount,
          id: model.id,
          queryCount: model.queryCount,
          result: map,
          status: model.status,
          ticker: model.ticker));
      if (box.length > 1) await box.delete(box.keys.first);
      break;
    case 4:
      final box = await Hive.openBox<DBModelToday>('dbmodeltoday');
      await box.add(DBModelToday(
          resultsCount: model.resultsCount,
          id: model.id,
          queryCount: model.queryCount,
          result: map,
          status: model.status,
          ticker: model.ticker));
      if (box.length > 1) await box.delete(box.keys.first);
      break;
  }
}
