import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:srv_demo/core/data/error/exception.dart';
import 'package:srv_demo/feature/auth/data/models/account_model.dart';
import 'package:srv_demo/feature/auth/data/models/security_request_model.dart';

abstract class AuthLocalDataSource {
  Future<AccountModel> auth(SecurityRequestModel model);
  Future<AccountModel> get(void request);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  SharedPreferences prefs;

  AuthLocalDataSourceImpl({
    required this.prefs,
  });

  @override
  Future<AccountModel> auth(SecurityRequestModel request) async {
    try {
      final result = prefs.getString('account');
      if (result != null) {
        final accountDeserialized = AccountModel.fromJson(
          json.decode(result) as Map<String, dynamic>,
        );
        return accountDeserialized;
      } else {
        final account =
            AccountModel(email: request.email, password: request.password);
        prefs.setString(
          'account',
          json.encode(
            account.toJson(),
          ),
        );
        return account;
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<AccountModel> get(void request) async {
    try {
      final result = prefs.getString('account');
      if (result != null) {
        final account = AccountModel.fromJson(
          json.decode(result) as Map<String, dynamic>,
        );
        return account;
      } else {
        throw CacheException();
      }
    } catch (e) {
      throw CacheException();
    }
  }
}
