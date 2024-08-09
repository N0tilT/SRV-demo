import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/core/data/usecases/usecase.dart';
import 'package:srv_demo/feature/auth/data/models/security_request_model.dart';
import 'package:srv_demo/feature/auth/domain/entities/account_entity.dart';
import 'package:srv_demo/feature/auth/domain/repositories/auth_repository.dart';

class Auth extends Usecase<AccountEntity, SecurityRequestModel> {
  final AuthRepository authRepository;

  Auth({required this.authRepository});

  @override
  Future<Either<Failure, AccountEntity>> call(
      SecurityRequestModel request,) async {
    final result = await authRepository.auth(request);
    return result.fold(
      (l) => Left(l),
      (r) => Right(AccountEntity.fromModel(r)),
    );
  }
}
