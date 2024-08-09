import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';

List<ItemEntity> hardcodedItemList = [
  const ItemEntity(
      id: 0,
      title: "title",
      description: "description",
      image: "resources/images/bag.png",
      isFavourite: false,
      price: 100,),
  const ItemEntity(
      id: 1,
      title: "title2",
      description: "description2",
      image: "resources/images/bag.png",
      isFavourite: false,
      price: 100,),
  const ItemEntity(
      id: 2,
      title: "title3",
      description: "description3",
      image: "resources/images/bag.png",
      isFavourite: true,
      price: 100,),
  const ItemEntity(
      id: 3,
      title: "title4",
      description: "description4",
      image: "resources/images/bag.png",
      isFavourite: false,
      price: 100,),
];
