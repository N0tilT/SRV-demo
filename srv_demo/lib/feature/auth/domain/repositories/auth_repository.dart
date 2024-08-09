import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/feature/auth/data/models/account_model.dart';
import 'package:srv_demo/feature/auth/data/models/security_request_model.dart';

abstract class AuthRepository{
  Future<Either<Failure,AccountModel>> auth(SecurityRequestModel request);
  Future<Either<Failure,AccountModel>> get(void request);
    Future<Either<Failure,void>> logout(void request);
}
