import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/exception.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/feature/auth/data/models/account_model.dart';
import 'package:srv_demo/feature/auth/data/models/security_request_model.dart';
import 'package:srv_demo/feature/favourite_list/data/datasources/auth_local_data_source.dart';
import 'package:srv_demo/feature/favourite_list/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AccountModel>> auth(
    SecurityRequestModel request,
  ) async {
    try {
      final localAuth = await localDataSource
          .auth(request);
      return Right(localAuth);
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка авторизации"));
    }
  }
  
  @override
  Future<Either<Failure, AccountModel>> get(void request) async {
    try {
      final localAuth = await localDataSource
          .get(request);
      return Right(localAuth);
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка авторизации"));
    }
  }
}
