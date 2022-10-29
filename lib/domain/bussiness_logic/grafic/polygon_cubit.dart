import 'package:divisas/data/contract/polygon_contract.dart';
import 'package:divisas/data/services/result.dart';
import 'package:divisas/domain/entities/aggregates_bar_entity.dart';
import 'package:divisas/screens/utils/time_convert.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'polygon_state.dart';

class PolygonCubit extends Cubit<PolygonState> {
  final PolygonContract _dataSource;
  PolygonCubit(PolygonContract dataSource)
      : _dataSource = dataSource,
        super(PolygonState());

  void aggregatesBarGet(int currentSelect) async {
    try {
      emit(state.copyWith(status: PolygonStateStatus.loading));
      Result<dynamic, BackendError> resp = await _dataSource.aggregatesBar(
          from: configutateFrom(currentSelect),
          to: formater(DateTime.now()),
          range: currentSelect == 0 || currentSelect == 1 ? "week" : "hour");
      if (resp.isSuccess) {
        AggregateBarEntity localModel =
            AggregateBarEntity.fromJson(resp.successRes);
        emit(state.copyWith(
            aggregateBarEntity: localModel,
            currentSelect: currentSelect,
            status: PolygonStateStatus.loaded,
            type: configutateType(currentSelect)));
      }
    } catch (e) {
      emit(state.copyWith(status: PolygonStateStatus.error));
    }
  }

  void changeLabelGrafic(String v) {
    emit(state.copyWith(label: v));
  }

  configutateType(int currentSelect) {
    Map type = {
      3: PolygonStateType.fivedays,
      4: PolygonStateType.oneday,
      2: PolygonStateType.onemonth,
      1: PolygonStateType.oneyear,
      0: PolygonStateType.twoyears,
    };
    return type[currentSelect];
  }

  configutateFrom(int currentSelect) {
    Map type = {
      3: timeFormatAggregates(5),
      4: timeFormatAggregates(1),
      2: timeFormatAggregates(30),
      1: timeFormatAggregates(365),
      0: timeFormatAggregates(730),
    };
    return type[currentSelect];
  }
}
