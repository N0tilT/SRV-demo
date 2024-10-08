import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/core/data/usecases/usecase.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/domain/repositories/items_repository.dart';

class LoadItems extends Usecase<List<ItemEntity>, void> {
  final ItemRepository itemsRepository;

  LoadItems({required this.itemsRepository});

  @override
  Future<Either<Failure, List<ItemEntity>>> call(
    void request,
  ) async {
    final result = await itemsRepository.load(request);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => ItemEntity.fromModel(e)).toList()),
    );
  }
}
