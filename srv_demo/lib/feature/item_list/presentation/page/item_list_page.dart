import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_controller.dart';

class ItemListPage extends ConsumerStatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends ConsumerState<ItemListPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(itemListControllerProvider.notifier).load();

    return ref.watch(itemListControllerProvider).when(
          init: () => Container(),
          success: (items) => Column(
            children: items.map((e) => Text(e.title)).toList(),
          ),
          fail: (errorMessage) => Text(errorMessage ?? "Товар"),
        );
  }
}
