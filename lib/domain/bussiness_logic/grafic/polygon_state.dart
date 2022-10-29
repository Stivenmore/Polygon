part of 'polygon_cubit.dart';

enum PolygonStateStatus { none, loading, loaded, error }

enum PolygonStateType { twoyears, oneyear, onemonth, fivedays, oneday }

class PolygonState extends Equatable {
  late final AggregateBarEntity aggregateBarEntity;
  late final PolygonStateStatus status;
  late final PolygonStateType type;
  late final int currentSelect;
  late final String label;

  PolygonState(
      {String? label,
      AggregateBarEntity? aggregateBarEntity,
      PolygonStateStatus? status,
      PolygonStateType? type,
      int? currentSelect,
      Widget? bottomTitleWidgets}) {
    this.status = status ?? PolygonStateStatus.none;
    this.aggregateBarEntity = aggregateBarEntity ?? singleEmptyAggre;
    this.type = type ?? PolygonStateType.twoyears;
    this.currentSelect = currentSelect ?? 4;
    this.label = label ?? '';
  }

  PolygonState copyWith(
      {AggregateBarEntity? aggregateBarEntity,
      PolygonStateStatus? status,
      PolygonStateType? type,
      int? currentSelect,
      Widget? bottomTitleWidgets,
      String? label}) {
    return PolygonState(
        aggregateBarEntity: aggregateBarEntity ?? this.aggregateBarEntity,
        status: status ?? this.status,
        type: type ?? this.type,
        currentSelect: currentSelect ?? this.currentSelect,
        label: label ?? this.label);
  }

  @override
  List<Object?> get props =>
      [status, aggregateBarEntity, type, currentSelect, label];
}
