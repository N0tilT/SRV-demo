import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/exception.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/feature/item_list/data/datasources/item_local_data_source.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';
import 'package:srv_demo/feature/item_list/domain/repositories/items_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource localDataSource;

  ItemRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<ItemModel>>> load(
    void request,
  ) async {
    try {
      final localItem = await localDataSource.load(request);
      return Right(localItem);
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка авторизации"));
    }
  }

  @override
  Future<Either<Failure, void>> upload(List<ItemModel> request) async {
    try {
      final localItem = await localDataSource.upload(request);
      return Right(localItem);
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка авторизации"));
    }
  }
  
  @override
  Future<Either<Failure, void>> updateItem(ItemModel request) async {
    try {
      final localItem = await localDataSource.update(request);
      return Right(localItem);
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка авторизации"));
    }
  }
}
