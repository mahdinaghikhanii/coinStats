// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usd_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsdModelAdapter extends TypeAdapter<UsdModel> {
  @override
  final int typeId = 1;

  @override
  UsdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsdModel(
      price: fields[0] as num,
      volume24h: fields[1] as num,
      percentChange_1h: fields[2] as num,
      percentChange_24h: fields[3] as num,
      percentChange_7d: fields[4] as num,
      percentChange_30d: fields[5] as num,
      percentChange_60d: fields[6] as num,
      percentChange_90d: fields[7] as num,
      marketCap: fields[8] as num,
      lastUpdated: fields[9] as String,
      fullydilutedmarketcap: fields[10] as num,
    );
  }

  @override
  void write(BinaryWriter writer, UsdModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.volume24h)
      ..writeByte(2)
      ..write(obj.percentChange_1h)
      ..writeByte(3)
      ..write(obj.percentChange_24h)
      ..writeByte(4)
      ..write(obj.percentChange_7d)
      ..writeByte(5)
      ..write(obj.percentChange_30d)
      ..writeByte(6)
      ..write(obj.percentChange_60d)
      ..writeByte(7)
      ..write(obj.percentChange_90d)
      ..writeByte(8)
      ..write(obj.marketCap)
      ..writeByte(9)
      ..write(obj.lastUpdated)
      ..writeByte(10)
      ..write(obj.fullydilutedmarketcap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
