part of 'realtime_currency_cubit.dart';

abstract class RealtimeCurrencyState extends Equatable {
  const RealtimeCurrencyState();

  @override
  List<Object> get props => [];
}

class RealtimeCurrencyLoading extends RealtimeCurrencyState {}

class RealtimeCurrencyLoaded extends RealtimeCurrencyState {
  const RealtimeCurrencyLoaded({required this.currencyConversionModel});
  final CurrencyConversionModel currencyConversionModel;

  @override
  List<Object> get props => [
        currencyConversionModel,
      ];
}

class RealtimeCurrencyError extends RealtimeCurrencyState {}
