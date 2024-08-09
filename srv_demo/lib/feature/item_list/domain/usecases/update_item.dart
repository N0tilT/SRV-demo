import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/core/data/usecases/usecase.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/domain/repositories/items_repository.dart';

class UpdateItem extends Usecase<void, ItemEntity> {
  final ItemRepository itemsRepository;

  UpdateItem({required this.itemsRepository});

  @override
  Future<Either<Failure, void>> call(
    ItemEntity request,
  ) async {
    final result = await itemsRepository.updateItem(
      ItemModel(
        id: request.id,
        title: request.title,
        description: request.description,
        image: request.image,
        isFavourite: request.isFavourite,
        price: request.price,
      ),
    );
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
