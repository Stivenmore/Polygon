import 'package:dio/dio.dart';
import 'package:divisas/data/contract/polygon_contract.dart';
import 'package:divisas/data/services/result.dart';
import 'package:divisas/device/conection_manager.dart';
import 'package:divisas/device/db/currency/db_model_currency.dart';
import 'package:divisas/domain/models/currency_conversion_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'realtime_currency_state.dart';

class RealtimeCurrencyCubit extends Cubit<RealtimeCurrencyState> {
  final PolygonContract _dataSource;
  final ConectionManager conectionManager;
  RealtimeCurrencyCubit(PolygonContract dataSource, this.conectionManager)
      : _dataSource = dataSource,
        super(RealtimeCurrencyLoading());

  getRealTImeCurrency() async {
    final box = await Hive.openBox<DBModelCurrency>('dbmodelcurrency');

    emit(RealtimeCurrencyLoading());
    try {
      Result<dynamic, BackendError> resp = await _dataSource
          .realTimeCurrencyConversion(from: 'USD', to: 'COP', precision: '2');
      if (resp.isSuccess) {
        CurrencyConversionModel localModel =
            CurrencyConversionModel.fromJson(resp.successRes);
        final boxkeylast = box.keys.length > 0 ? box.keys.last : 0;
        final model = box.get(boxkeylast);
        if (model?.time != localModel.time) {
          await box.add(
            DBModelCurrency(
                converted: localModel.converted,
                ask: localModel.ask,
                bid: localModel.bid,
                exchange: localModel.exchange,
                id: localModel.id,
                symbol: localModel.symbol,
                initialAmout: localModel.initialAmout,
                time: localModel.time),
          );
        }
        emit(RealtimeCurrencyLoaded(
            currencyConversionModel: localModel,
            isConnected: conectionManager.isConection));
      } else {
        box.length != 0
            ? localmethod()
            : emit(RealtimeCurrencyError(
                isConnected: conectionManager.isConection));
      }
    } catch (e) {
      box.length != 0
          ? localmethod()
          : emit(
              RealtimeCurrencyError(isConnected: conectionManager.isConection));
    }
  }

  localmethod() async {
    final box = await Hive.openBox<DBModelCurrency>('dbmodelcurrency');
    final boxkeylast = box.keys.last;
    final model = box.get(boxkeylast) as DBModelCurrency;
    CurrencyConversionModel dbmodel = CurrencyConversionModel(
        converted: model.converted,
        ask: model.ask,
        bid: model.bid,
        exchange: model.exchange,
        id: model.id,
        symbol: model.symbol,
        initialAmout: model.initialAmout,
        time: model.time);
    emit(RealtimeCurrencyLoaded(
        currencyConversionModel: dbmodel, isConnected: false));
  }
}
