// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model_currency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBModelCurrencyAdapter extends TypeAdapter<DBModelCurrency> {
  @override
  final int typeId = 6;

  @override
  DBModelCurrency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBModelCurrency(
      converted: fields[0] as int,
      ask: fields[2] as String,
      bid: fields[3] as String,
      exchange: fields[4] as String,
      id: fields[7] as String,
      initialAmout: fields[1] as int,
      symbol: fields[6] as String,
      time: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBModelCurrency obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.converted)
      ..writeByte(1)
      ..write(obj.initialAmout)
      ..writeByte(2)
      ..write(obj.ask)
      ..writeByte(3)
      ..write(obj.bid)
      ..writeByte(4)
      ..write(obj.exchange)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.symbol)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBModelCurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
