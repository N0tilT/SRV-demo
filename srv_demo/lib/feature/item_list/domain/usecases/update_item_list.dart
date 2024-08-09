import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/core/data/usecases/usecase.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/domain/repositories/items_repository.dart';

class UpdateItemList extends Usecase<void, List<ItemEntity>> {
  final ItemRepository itemsRepository;

  UpdateItemList({required this.itemsRepository});

  @override
  Future<Either<Failure, void>> call(
    List<ItemEntity> request,
  ) async {
    final result = await itemsRepository.upload(
      request
          .map(
            (e) => ItemModel(
              id: e.id,
              title: e.title,
              description: e.description,
              image: e.image,
              isFavorite: e.isFavorite,
              price: e.price,
            ),
          )
          .toList(),
    );
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
