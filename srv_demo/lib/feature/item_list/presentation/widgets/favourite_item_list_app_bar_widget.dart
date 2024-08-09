import 'package:flutter/material.dart';

class FavouriteItemListAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const FavouriteItemListAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      titleSpacing: 0,
      centerTitle: true,
      title: const Text(
        'Избранное',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
