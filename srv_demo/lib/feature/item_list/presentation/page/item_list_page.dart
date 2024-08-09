import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:srv_demo/core/constants/items.dart';
import 'package:srv_demo/core/constants/routes.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/selected_item_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/widgets/item_card.dart';
import 'package:srv_demo/feature/item_list/presentation/widgets/item_list_app_bar_widget.dart';

class ItemListPage extends ConsumerStatefulWidget {
  const ItemListPage({super.key});

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends ConsumerState<ItemListPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(itemListControllerProvider.notifier).loadItems();
    return Scaffold(
      appBar: const ItemListAppBarWidget(),
      body: ref.watch(itemListControllerProvider).when(
            init: () => Container(),
            success: (items) => Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      item: items[index],
                      press: () {
                        ref.watch(selectedItemProvider.notifier).state =
                            items[index];
                        context.push(detailsRoute);
                      },
                    ),
                  ),
                ),
              ),
            ),
            fail: (errorMessage) => Text(errorMessage ?? "Товар"),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .watch(itemListControllerProvider.notifier)
              .updateList(hardcodedItemList);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
