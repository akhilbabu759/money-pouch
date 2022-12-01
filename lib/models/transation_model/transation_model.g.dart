// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransationModelAdapter extends TypeAdapter<TransationModel> {
  @override
  final int typeId = 0;

  @override
  TransationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransationModel(
      amount: fields[2] as int,
      category: fields[3] as String,
      isIncome: fields[1] as bool,
      date: fields[4] as DateTime,
      id: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, TransationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isIncome)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
