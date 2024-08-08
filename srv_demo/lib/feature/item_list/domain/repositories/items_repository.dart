import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';

abstract class ItemRepository{
  Future<Either<Failure,List<ItemModel>>> load(void request);
}
