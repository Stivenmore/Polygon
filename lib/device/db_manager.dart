import 'package:divisas/device/db/currency/db_model_currency.dart';
import 'package:divisas/device/db/month/db_model_month.dart';
import 'package:divisas/device/db/oneyear/db_model_oneyear.dart';
import 'package:divisas/device/db/today/db_model_today.dart';
import 'package:divisas/device/db/twoyear/db_model_twoyear.dart';
import 'package:divisas/device/db/week/db_model_week.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DBmanager {
  static init() async {
    final document = await getApplicationDocumentsDirectory();
    Hive.initFlutter(document.path);
    Hive.registerAdapter<DBModelCurrency>(DBModelCurrencyAdapter());
    Hive.registerAdapter<DBModelToday>(DBModelTodayAdapter());
    Hive.registerAdapter<DBModelWeek>(DBModelWeekAdapter());
    Hive.registerAdapter<DBModelMonth>(DBModelMonthAdapter());
    Hive.registerAdapter<DBModelOneYear>(DBModelOneYearAdapter());
    Hive.registerAdapter<DBModelTwoYear>(DBModelTwoYearAdapter());
  }

  static dispose() {
    Hive.close();
  }
}
