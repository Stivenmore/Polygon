part of 'polygon_cubit.dart';

enum PolygonStateStatus { none, loading, loaded, error }

enum PolygonStateConnection { activate, desactivate }

enum PolygonStateType { twoyears, oneyear, onemonth, fivedays, oneday }

class PolygonState extends Equatable {
  late final AggregateBarEntity aggregateBarEntity;
  late final PolygonStateStatus status;
  late final PolygonStateType type;
  late final int currentSelect;
  late final String label;
  late final PolygonStateConnection connection;

  PolygonState(
      {String? label,
      AggregateBarEntity? aggregateBarEntity,
      PolygonStateStatus? status,
      PolygonStateType? type,
      int? currentSelect,
      Widget? bottomTitleWidgets,
      PolygonStateConnection? connection}) {
    this.status = status ?? PolygonStateStatus.none;
    this.aggregateBarEntity = aggregateBarEntity ?? singleEmptyAggre;
    this.type = type ?? PolygonStateType.twoyears;
    this.currentSelect = currentSelect ?? 3;
    this.label = label ?? '';
    this.connection = connection ?? PolygonStateConnection.activate;
  }

  PolygonState copyWith(
      {AggregateBarEntity? aggregateBarEntity,
      PolygonStateStatus? status,
      PolygonStateType? type,
      int? currentSelect,
      Widget? bottomTitleWidgets,
      String? label,
      PolygonStateConnection? connection}) {
    return PolygonState(
        aggregateBarEntity: aggregateBarEntity ?? this.aggregateBarEntity,
        status: status ?? this.status,
        type: type ?? this.type,
        currentSelect: currentSelect ?? this.currentSelect,
        label: label ?? this.label,
        connection: connection ?? this.connection);
  }

  @override
  List<Object?> get props =>
      [status, aggregateBarEntity, type, currentSelect, label, connection];
}
