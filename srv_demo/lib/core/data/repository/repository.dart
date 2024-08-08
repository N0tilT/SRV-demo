import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/datasource/datasource.dart';
import 'package:srv_demo/core/data/error/exception.dart';
import 'package:srv_demo/core/data/error/failure.dart';

Future<Either<Failure, ResponseType>> loadData<Local extends LocalDataSource,
    Remote extends RemoteDataSource, ResponseType, RequestType>(
  Local localDataSource,
  Remote remoteDataSource,
  bool remote,
  RequestType request,
) async {
  try {
    return Right(await localDataSource.load(request) as ResponseType);
  } on CacheException {
    return const Left(
      CacheFailure(message: "Ошибка локального хранилища"),
    );
  }
}

Future<Either<Failure, ResponseType>> uploadData<Local extends LocalDataSource,
    Remote extends RemoteDataSource, ResponseType, RequestType>(
  Local localDataSource,
  Remote remoteDataSource,
  bool remote,
  ResponseType request,
) async {
  try {
    return Right(await localDataSource.update(request) as ResponseType);
  } on CacheException {
    return const Left(
      CacheFailure(message: "Ошибка локального хранилища"),
    );
  }
}
