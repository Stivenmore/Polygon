import 'package:divisas/data/contract/polygon_contract.dart';
import 'package:divisas/data/services/result.dart';
import 'package:divisas/domain/models/currency_conversion_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'realtime_currency_state.dart';

class RealtimeCurrencyCubit extends Cubit<RealtimeCurrencyState> {
  final PolygonContract _dataSource;
  RealtimeCurrencyCubit(PolygonContract dataSource)
      : _dataSource = dataSource,
        super(RealtimeCurrencyLoading());

  Future getRealTImeCurrency() async {
    emit(RealtimeCurrencyLoading());
    try {
      Result<dynamic, BackendError> resp = await _dataSource
          .realTimeCurrencyConversion(from: 'USD', to: 'COP', precision: '2');
      if (resp.isSuccess) {
        CurrencyConversionModel localModel =
            CurrencyConversionModel.fromJson(resp.successRes);
        emit(RealtimeCurrencyLoaded(
          currencyConversionModel: localModel,
        ));
      }
    } catch (e) {
      emit(RealtimeCurrencyError());
    }
  }
}
