import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:srv_demo/core/constants/routes.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/favourite_item_list_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/selected_item_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/widgets/item_card.dart';

class FavouriteListPage extends ConsumerStatefulWidget {
  const FavouriteListPage({super.key});

  @override
  _FavouriteListPageState createState() => _FavouriteListPageState();
}

class _FavouriteListPageState extends ConsumerState<FavouriteListPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(favouriteItemListControllerProvider.notifier).load();
    return ref.watch(favouriteItemListControllerProvider).when(
            init: () => Container(),
            success: (items) => Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
          
    );
  }
}
