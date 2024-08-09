import 'package:flutter/material.dart';
import 'package:srv_demo/core/constants/colors.dart';
import 'package:srv_demo/feature/auth/presentation/page/profile_page.dart';
import 'package:srv_demo/feature/item_list/presentation/page/favorite_list_page.dart';
import 'package:srv_demo/feature/item_list/presentation/page/item_list_page.dart';

class MainNavigatorWidget extends StatefulWidget {
  const MainNavigatorWidget({super.key});

  @override
  State<MainNavigatorWidget> createState() =>
      _MainNavigatorWidgetState();
}

class _MainNavigatorWidgetState extends State<MainNavigatorWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const ItemListPage(),
    const FavouriteListPage(),
    const ProfilePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2),
            label: "Товары",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Любимое",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профиль",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
