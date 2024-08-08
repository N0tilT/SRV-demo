import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';

part 'item_entity.freezed.dart';

@freezed
class ItemEntity with _$ItemEntity {
  const factory ItemEntity({
    required int id,
    required String title,
    required String description,
    required String image,
    required bool isFavourite,
  }) = _ItemEntity;

  factory ItemEntity.fromModel(ItemModel model) => ItemEntity(
        id: model.id,
        title: model.title,
        description: model.description,
        image: model.image,
        isFavourite: model.isFavourite,
      );
}
