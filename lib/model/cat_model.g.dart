// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatAdapter extends TypeAdapter<Cat> {
  @override
  final int typeId = 0;

  @override
  Cat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cat(
      text: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cat obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      text: json['text'] as String,
    );

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'text': instance.text,
    };
