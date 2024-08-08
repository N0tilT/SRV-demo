import 'package:flutter/material.dart';
import 'package:srv_demo/feature/favourite_list/presentation/favourite_list_page.dart';
import 'package:srv_demo/feature/item_list/presentation/page/item_list_page.dart';
import 'package:srv_demo/feature/profile/presentation/page/profile_page.dart';

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
      backgroundColor: const Color.fromARGB(255, 114, 121, 150),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox_rounded),
            label: "Товары",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Любимое",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Профиль",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
