import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DetailsPageAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left_sharp,
          color: Colors.white,
        ),
        onPressed: () => {context.pop()},
      ),
      titleSpacing: 0,
      centerTitle: true,
      title: const Text(
        'О товаре',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
