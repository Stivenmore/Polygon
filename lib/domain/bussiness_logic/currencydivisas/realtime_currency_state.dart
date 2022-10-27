part of 'realtime_currency_cubit.dart';

enum RealtimeCurrencyStateStatus { none, loading, loaded, error }

class RealtimeCurrencyState extends Equatable {
  late final CurrencyConversionModel currencyConversionModel;
  late final RealtimeCurrencyStateStatus status;

  RealtimeCurrencyState(
      {CurrencyConversionModel? currencyConversionModel,
      RealtimeCurrencyStateStatus? status}) {
    this.status = status ?? RealtimeCurrencyStateStatus.none;
    this.currencyConversionModel = currencyConversionModel ?? singleEmpty;
  }
  @override
  List<Object?> get props => [
        currencyConversionModel,
        status,
      ];

  RealtimeCurrencyState copyWith(
      {CurrencyConversionModel? currencyConversionModel,
      RealtimeCurrencyStateStatus? status}) {
    return RealtimeCurrencyState(
        currencyConversionModel:
            currencyConversionModel ?? this.currencyConversionModel,
        status: status ?? this.status);
  }
}
