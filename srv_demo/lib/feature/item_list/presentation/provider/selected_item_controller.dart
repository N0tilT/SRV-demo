import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';

final selectedItemProvider = StateProvider<ItemEntity>((ref) {
  return const ItemEntity(
      id: -1,
      title: "title",
      description: "description",
      image: "image",
      isFavorite: false,
      price: 0.0,);
});
