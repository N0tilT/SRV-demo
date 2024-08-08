import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/auth/presentation/provider/user_controller.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(userControllerProvider.notifier).getProfile();

    return ref.watch(userControllerProvider).when(
          init: () => Container(),
          success: (account) => Column(
            children: [
              Text(account.email),
              Text(account.password),
            ],
          ),
          fail: (errorMessage) => Text(errorMessage!),
        );
  }
}
