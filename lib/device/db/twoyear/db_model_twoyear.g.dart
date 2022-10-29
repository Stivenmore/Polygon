// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model_twoyear.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBModelTwoYearAdapter extends TypeAdapter<DBModelTwoYear> {
  @override
  final int typeId = 4;

  @override
  DBModelTwoYear read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBModelTwoYear(
      resultsCount: fields[0] as int,
      id: fields[4] as String,
      queryCount: fields[1] as int,
      result: (fields[5] as List).cast<dynamic>(),
      status: fields[2] as String,
      ticker: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBModelTwoYear obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.resultsCount)
      ..writeByte(1)
      ..write(obj.queryCount)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.ticker)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.result);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBModelTwoYearAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
