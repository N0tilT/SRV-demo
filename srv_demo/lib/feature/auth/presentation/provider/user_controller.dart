import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/auth/data/models/security_request_model.dart';
import 'package:srv_demo/feature/auth/domain/entities/account_entity.dart';
import 'package:srv_demo/feature/auth/domain/usecases/auth.dart';
import 'package:srv_demo/feature/auth/domain/usecases/get_profile.dart';
import 'package:srv_demo/feature/auth/presentation/provider/auth_state.dart';
import 'package:srv_demo/injection_container.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, AuthState>((ref) {
  return sl<UserController>();
});

class UserController extends StateNotifier<AuthState> {
  final Auth auth;
  final GetProfile get;

  UserController(super.state, {required this.auth, required this.get});

  Future<Either<String, AccountEntity>> login({
    required SecurityRequestModel request,
  }) async {
    final result = await auth.call(request);
    return result.fold(
      (l) {
        state = AuthState.fail(l.message);
        return Left(l.message);
      },
      (r) {
        state = AuthState.success(r);
        return Right(r);
      },
    );
  }

  Future<Either<String, AccountEntity>> getProfile() async {
    final result = await get.call(() {});
    return result.fold(
      (l) {
        state = AuthState.fail(l.message);
        return Left(l.message);
      },
      (r) {
        state = AuthState.success(r);
        return Right(r);
      },
    );
  }
}
