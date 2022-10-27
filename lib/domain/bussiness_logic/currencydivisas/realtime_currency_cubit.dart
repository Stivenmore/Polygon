import 'package:divisas/data/datasources/polygon_rest_datasource.dart';
import 'package:divisas/data/services/result.dart';
import 'package:divisas/domain/models/currency_conversion_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'realtime_currency_state.dart';

class RealtimeCurrencyCubit extends Cubit<RealtimeCurrencyState> {
  final PolygonRestDataSource _dataSource;
  RealtimeCurrencyCubit(PolygonRestDataSource dataSource)
      : _dataSource = dataSource,
        super(RealtimeCurrencyState());

  void getRealTImeCurrency() async {
    emit(state.copyWith(status: RealtimeCurrencyStateStatus.loading));
    try {
      Result<dynamic, BackendError> resp = await _dataSource
          .realTimeCurrencyConversion(from: 'USD', to: 'COP', precision: '2');
      if (resp.isSuccess) {
        CurrencyConversionModel localModel =
            CurrencyConversionModel.fromJson(resp.successRes);
        emit(state.copyWith(
            currencyConversionModel: localModel,
            status: RealtimeCurrencyStateStatus.loaded));
      }
    } catch (e) {
      emit(state.copyWith(status: RealtimeCurrencyStateStatus.error));
    }
  }
}
