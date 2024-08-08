import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:srv_demo/core/constants/routes.dart';
import 'package:srv_demo/core/navigator/navigator.dart';
import 'package:srv_demo/feature/auth/presentation/page/auth_page.dart';
import 'package:srv_demo/feature/favourite_list/presentation/favourite_list_page.dart';
import 'package:srv_demo/feature/item_list/presentation/page/item_list_page.dart';
import 'package:srv_demo/feature/profile/presentation/page/profile_page.dart';
// import 'package:srv_demo/core/constant_values/routes.dart';
// import 'package:srv_demo/core/navigator/navigator.dart';
// import 'package:srv_demo/feature/auth/presentation/pages/main_auth_widget.dart';
// import 'package:srv_demo/injection_container.dart';

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
    return MaterialApp(
      title: 'Онлайн-магазин',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 101, 59, 159),
        ),
        fontFamily: 'Inter',
      ),
      home: const Initializer(),
      routes: {
        mainRoute: (context) => const MainNavigatorWidget(),
        authRoute: (context) => const LoginAuthPage(),
        profileRoute: (context) => const ProfilePage(),
        itemListRoute: (context) => const ItemListPage(),
        favouriteListRoute: (context) => const FavouriteListPage(),
      },
    );
  }
}



class Initializer extends StatefulWidget {
  const Initializer({super.key});

  @override
  State<Initializer> createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MainNavigatorWidget();
    //auth
    // final tokenCubit = context.watch<TokenCubit>();
    // return tokenCubit.state.when(
    //   initial: () => const Center(child: GardenLoadingWidget()),
    //   authorized: (token) => const Center(child: GardenLoadingWidget()),
    //   fail: (l) => const MainAuthPage(),
    //   unauthorized: () => const MainAuthPage(),
    //   tokenSuccess: (token) {
    //     return const MainNavigatorWidget();
    //   },
    // );
  }
}
