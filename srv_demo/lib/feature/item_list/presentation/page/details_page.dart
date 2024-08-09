import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/core/constants/colors.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/selected_item_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/widgets/details_page_app_bar_widget.dart';

class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(selectedItemProvider);
    return Scaffold(
      appBar: const DetailsPageAppBarWidget(),
      backgroundColor: mainBackgroundColor,
      body: Column(
        children: [
          ProductTitleWithImage(item: item),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Text(
                      item.description,
                      style: const TextStyle(height: 1.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTitleWithImage extends StatelessWidget {
  final ItemEntity item;
  const ProductTitleWithImage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: "${item.id}",
                child: Image.asset(
                  item.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              item.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 26),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "\$${item.price}",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer(
                      builder: (context, ref, child) => IconButton(
                        onPressed: () {
                          ref.watch(selectedItemProvider.notifier).state =
                              item.copyWith(
                            isFavorite: !item.isFavorite,
                          );
                          ref.watch(itemListControllerProvider.notifier).updateItem(
                                item.copyWith(
                                  isFavorite: !item.isFavorite,
                                ),
                              );
                        },
                        icon: Icon(
                          size: 40,
                          Icons.star,
                          color: item.isFavorite ? Colors.yellow : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
