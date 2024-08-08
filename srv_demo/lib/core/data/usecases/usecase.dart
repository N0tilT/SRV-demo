import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
