part of 'realtime_currency_cubit.dart';

abstract class RealtimeCurrencyState extends Equatable {
  const RealtimeCurrencyState();

  @override
  List<Object> get props => [];
}

class RealtimeCurrencyLoading extends RealtimeCurrencyState {}

class RealtimeCurrencyLoaded extends RealtimeCurrencyState {
  const RealtimeCurrencyLoaded(
      {required this.currencyConversionModel, required this.isConnected});
  final CurrencyConversionModel currencyConversionModel;
  final bool isConnected;

  @override
  List<Object> get props => [currencyConversionModel, isConnected];
}

class RealtimeCurrencyError extends RealtimeCurrencyState {
  final bool isConnected;
  RealtimeCurrencyError({required this.isConnected});

  @override
  List<Object> get props => [isConnected];
}
