// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class ItemModel extends HiveObject with _$ItemModel {
  @HiveType(typeId: 1, adapterName: 'ItemModelAdapter')
  factory ItemModel({
    @JsonKey(name: 'Id') @HiveField(0) required int id,
    @JsonKey(name: 'Title') @HiveField(1) required String title,
    @JsonKey(name: 'Description') @HiveField(2) required String description,
    @JsonKey(name: 'Image') @HiveField(3) required String image,
    @JsonKey(name: 'IsFavourite') @HiveField(4) required bool isFavourite,
  }) = _ItemModel;

  ItemModel._();

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
