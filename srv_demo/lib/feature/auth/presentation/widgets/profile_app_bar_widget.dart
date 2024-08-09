import 'package:flutter/material.dart';

class ProfileAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const ProfileAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      title: const Text(
        'Профиль',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
