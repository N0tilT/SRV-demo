import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:srv_demo/core/constants/routes.dart';
import 'package:srv_demo/feature/auth/presentation/provider/user_controller.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(userControllerProvider.notifier).getProfile();

    return ref.watch(userControllerProvider).when(
          init: () => Container(),
          success: (account) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  account.email,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    ref.read(userControllerProvider.notifier).logout();
                    context.go(authRoute);
                  },
                  child: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          fail: (errorMessage) => Text(errorMessage!),
        );
  }
}
