import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srv_demo/feature/auth/domain/entities/account_entity.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.init() = _Initial;
  const factory AuthState.success(AccountEntity account) = _Success;
  const factory AuthState.fail(String? errorMessage) = _Fail;

}
