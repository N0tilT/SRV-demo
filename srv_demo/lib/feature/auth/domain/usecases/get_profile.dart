import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/core/data/usecases/usecase.dart';
import 'package:srv_demo/feature/auth/domain/entities/account_entity.dart';
import 'package:srv_demo/feature/auth/domain/repositories/auth_repository.dart';

class GetProfile extends Usecase<AccountEntity, void> {
  final AuthRepository authRepository;

  GetProfile({required this.authRepository});

  @override
  Future<Either<Failure, AccountEntity>> call(void request) async {
    final result = await authRepository.get(request);

    return result.fold(
      (l) => Left(l),
      (r) => Right(AccountEntity.fromModel(r)),
    );
  }
}
