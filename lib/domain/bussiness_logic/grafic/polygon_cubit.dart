import 'package:divisas/data/contract/polygon_contract.dart';
import 'package:divisas/data/services/result.dart';
import 'package:divisas/device/db/month/db_model_month.dart';
import 'package:divisas/device/db/oneyear/db_model_oneyear.dart';
import 'package:divisas/device/db/today/db_model_today.dart';
import 'package:divisas/device/db/twoyear/db_model_twoyear.dart';
import 'package:divisas/device/db/week/db_model_week.dart';
import 'package:divisas/domain/bussiness_logic/grafic/segregation_save_local.dart';
import 'package:divisas/domain/entities/aggregates_bar_entity.dart';
import 'package:divisas/screens/utils/time_convert.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'polygon_state.dart';

class PolygonCubit extends Cubit<PolygonState> {
  final PolygonContract _dataSource;
  PolygonCubit(PolygonContract dataSource)
      : _dataSource = dataSource,
        super(PolygonState());

  Future aggregatesBarGet(int currentSelect) async {
    try {
      emit(state.copyWith(status: PolygonStateStatus.loading));
      Result<dynamic, BackendError> resp = await _dataSource.aggregatesBar(
          from: configutateFrom(currentSelect),
          to: formater(DateTime.now()),
          range: currentSelect == 0 || currentSelect == 1 ? "week" : "hour");
      if (resp.isSuccess) {
        AggregateBarEntity localModel =
            AggregateBarEntity.fromJson(resp.successRes);
        await configurationLocalSave(
            currentSelect, localModel, resp.successRes["results"]);
        emit(state.copyWith(
            aggregateBarEntity: localModel,
            currentSelect: currentSelect,
            status: PolygonStateStatus.loaded,
            connection: PolygonStateConnection.activate,
            type: configutateType(currentSelect)));
      } else {
        localgetData(currentSelect);
      }
    } catch (e) {
      localgetData(currentSelect);
    }
  }

  localgetData(int currentSelect) async {
    switch (currentSelect) {
      case 0:
        final box = await Hive.openBox<DBModelTwoYear>('dbmodeltwoyear');
        final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
        final model = box.get(boxkeylast) as DBModelTwoYear;
        if (box.length > 0) {
          AggregateBarEntity localmodel = AggregateBarEntity(
              resultsCount: model.resultsCount,
              id: model.id,
              queryCount: model.queryCount,
              status: model.status,
              ticker: model.ticker,
              result: model.result
                  .map((e) => AggregateBarResult.fromJson(e))
                  .toList());
          emit(state.copyWith(
              aggregateBarEntity: localmodel,
              currentSelect: currentSelect,
              status: PolygonStateStatus.loaded,
              type: configutateType(currentSelect)));
        } else {
          emit(state.copyWith(status: PolygonStateStatus.error));
        }
        break;
      case 1:
        final box = await Hive.openBox<DBModelOneYear>('dbmodeloneyear');
        final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
        final model = box.get(boxkeylast) as DBModelOneYear;
        if (box.length > 0) {
          AggregateBarEntity localmodel = AggregateBarEntity(
              resultsCount: model.resultsCount,
              id: model.id,
              queryCount: model.queryCount,
              status: model.status,
              ticker: model.ticker,
              result: model.result
                  .map((e) => AggregateBarResult.fromJson(e))
                  .toList());
          emit(state.copyWith(
              aggregateBarEntity: localmodel,
              currentSelect: currentSelect,
              status: PolygonStateStatus.loaded,
              type: configutateType(currentSelect)));
        } else {
          emit(state.copyWith(status: PolygonStateStatus.error));
        }
        break;
      case 2:
        final box = await Hive.openBox<DBModelMonth>('dbmodelmonth');
        final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
        final model = box.get(boxkeylast) as DBModelMonth;
        if (box.length > 0) {
          AggregateBarEntity localmodel = AggregateBarEntity(
              resultsCount: model.resultsCount,
              id: model.id,
              queryCount: model.queryCount,
              status: model.status,
              ticker: model.ticker,
              result: model.result
                  .map((e) => AggregateBarResult.fromJson(e))
                  .toList());
          emit(state.copyWith(
              aggregateBarEntity: localmodel,
              currentSelect: currentSelect,
              status: PolygonStateStatus.loaded,
              type: configutateType(currentSelect)));
        } else {
          emit(state.copyWith(status: PolygonStateStatus.error));
        }
        break;
      case 3:
        final box = await Hive.openBox<DBModelWeek>('dbmodelweek');
        final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
        final model = box.get(boxkeylast) as DBModelWeek;
        if (box.length > 0) {
          AggregateBarEntity localmodel = AggregateBarEntity(
              resultsCount: model.resultsCount,
              id: model.id,
              queryCount: model.queryCount,
              status: model.status,
              ticker: model.ticker,
              result: model.result
                  .map((e) => AggregateBarResult.fromJson(e))
                  .toList());
          emit(state.copyWith(
              aggregateBarEntity: localmodel,
              currentSelect: currentSelect,
              status: PolygonStateStatus.loaded,
              type: configutateType(currentSelect)));
        } else {
          emit(state.copyWith(status: PolygonStateStatus.error));
        }
        break;
      case 4:
        final box = await Hive.openBox<DBModelToday>('dbmodeltoday');
        final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
        final model = box.get(boxkeylast) as DBModelToday;
        if (box.length > 0) {
          AggregateBarEntity localmodel = AggregateBarEntity(
              resultsCount: model.resultsCount,
              id: model.id,
              queryCount: model.queryCount,
              status: model.status,
              ticker: model.ticker,
              result: model.result
                  .map((e) => AggregateBarResult.fromJson(e))
                  .toList());
          emit(state.copyWith(
              aggregateBarEntity: localmodel,
              currentSelect: currentSelect,
              status: PolygonStateStatus.loaded,
              type: configutateType(currentSelect)));
        } else {
          emit(state.copyWith(status: PolygonStateStatus.error));
        }
        break;
    }
  }

  void changeLabelGrafic(String v) {
    emit(state.copyWith(label: v));
  }

  configutateType(int currentSelect) {
    Map type = {
      0: PolygonStateType.twoyears,
      1: PolygonStateType.oneyear,
      2: PolygonStateType.onemonth,
      3: PolygonStateType.fivedays,
      4: PolygonStateType.oneday,
    };
    return type[currentSelect];
  }

  configutateFrom(int currentSelect) {
    Map type = {
      0: timeFormatAggregates(730),
      1: timeFormatAggregates(365),
      2: timeFormatAggregates(30),
      3: timeFormatAggregates(5),
      4: timeFormatAggregates(1),
    };
    return type[currentSelect];
  }
}
