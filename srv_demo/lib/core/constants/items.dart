import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';

List<ItemEntity> hardcodedItemList = [
  const ItemEntity(
      id: 0,
      title: "Товар №1",
      description: "Описание товара",
      image: "resources/images/bag.png",
      isFavourite: false,
      price: 100,),
  const ItemEntity(
      id: 1,
      title: "Товар №2",
      description: "Описание товара",
      image: "resources/images/bag.png",
      isFavourite: false,
      price: 200,),
  const ItemEntity(
      id: 2,
      title: "Товар №3",
      description: "Описание товара",
      image: "resources/images/bag.png",
      isFavourite: true,
      price: 300,),
  const ItemEntity(
      id: 3,
      title: "Товар №4",
      description: "Описание товара",
      image: "resources/images/bag.png",
      isFavourite: false,
      price: 400,),
];
