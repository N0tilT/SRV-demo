import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srv_demo/feature/auth/data/models/account_model.dart';

part 'account_entity.freezed.dart';

@freezed
class AccountEntity with _$AccountEntity {
  const factory AccountEntity({
    required String email,
    required String password,
  }) = _AccountEntity;

  factory AccountEntity.fromModel(AccountModel model) => AccountEntity(
        email: model.email,
        password: model.password,
      );
}
