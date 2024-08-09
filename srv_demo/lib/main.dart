import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:srv_demo/core/constants/colors.dart';
import 'package:srv_demo/core/constants/routes.dart';
import 'package:srv_demo/core/navigator/navigator.dart';
import 'package:srv_demo/feature/auth/presentation/page/auth_page.dart';
import 'package:srv_demo/feature/auth/presentation/page/profile_page.dart';
import 'package:srv_demo/feature/auth/presentation/provider/user_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/page/details_page.dart';
import 'package:srv_demo/feature/item_list/presentation/page/favorite_list_page.dart';
import 'package:srv_demo/feature/item_list/presentation/page/item_list_page.dart';

import 'package:srv_demo/injection_container.dart' as di;

void main() async {
  await Hive.initFlutter();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Онлайн-магазин',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: mainAppBarColor,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: selectedBottomNavigationBarItemColor,),
          fontFamily: 'Inter',
        ),
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Initializer(),
    ),
    GoRoute(
      path: mainRoute,
      builder: (context, state) => const MainNavigatorWidget(),
    ),
    GoRoute(
      path: authRoute,
      builder: (context, state) => const LoginAuthPage(),
    ),
    GoRoute(
      path: itemListRoute,
      builder: (context, state) => const ItemListPage(),
    ),
    GoRoute(
      path: favouriteListRoute,
      builder: (context, state) => const FavouriteListPage(),
    ),
    GoRoute(
      path: profileRoute,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: detailsRoute,
      builder: (context, state) => const DetailsPage(),
    ),
  ],
);

class Initializer extends ConsumerStatefulWidget {
  const Initializer({super.key});

  @override
  _InitializerState createState() => _InitializerState();
}

class _InitializerState extends ConsumerState<Initializer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return const MainNavigatorWidget();
    //auth
    ref.watch(userControllerProvider.notifier).getProfile();

    return ref.watch(userControllerProvider).when(
          init: () => const Center(child: CircularProgressIndicator()),
          success: (success) => const MainNavigatorWidget(),
          fail: (fail) => const LoginAuthPage(),
        );
  }
}
