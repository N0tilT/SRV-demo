// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<_$ItemModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$ItemModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ItemModelImpl(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      image: fields[3] as String,
      isFavorite: fields[4] as bool,
      price: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$ItemModelImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.isFavorite)
      ..writeByte(5)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemModelImpl _$$ItemModelImplFromJson(Map<String, dynamic> json) =>
    _$ItemModelImpl(
      id: (json['Id'] as num).toInt(),
      title: json['Title'] as String,
      description: json['Description'] as String,
      image: json['Image'] as String,
      isFavorite: json['IsFavourite'] as bool,
      price: (json['Price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ItemModelImplToJson(_$ItemModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Description': instance.description,
      'Image': instance.image,
      'IsFavourite': instance.isFavorite,
      'Price': instance.price,
    };
