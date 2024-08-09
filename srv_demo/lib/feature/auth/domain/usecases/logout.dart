import 'package:dartz/dartz.dart';
import 'package:srv_demo/core/data/error/failure.dart';
import 'package:srv_demo/core/data/usecases/usecase.dart';
import 'package:srv_demo/feature/auth/domain/repositories/auth_repository.dart';

class Logout extends Usecase<void, void> {
  final AuthRepository authRepository;

  Logout({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(
      void request,) async {
    final result = await authRepository.logout(request);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
