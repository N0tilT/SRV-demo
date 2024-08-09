import 'package:flutter/material.dart';

class ItemListAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const ItemListAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      titleSpacing: 0,
      centerTitle: true,
      title: const Text(
        'Список товаров',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
