// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel extends HiveObject with _$AccountModel {
  @HiveType(typeId: 0, adapterName: 'AccountModelAdapter')
  factory AccountModel({
    @JsonKey(name: 'Email') @HiveField(0) required String email,
    @JsonKey(name: 'Password') @HiveField(1) required String password,
  }) = _AccountModel;

  AccountModel._();

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
