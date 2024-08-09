import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DetailsPageAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: 5,
                      right: 5,
                    ),
                    // height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            item.description,
                            style: const TextStyle(height: 1.5),
                          ),
                        ),
                        const SizedBox(height: 5 / 2),
                        Consumer(
                          builder: (context, ref, child) => IconButton(
                              onPressed: () {
                                ref.watch(selectedItemProvider.notifier).state =
                                    item.copyWith(
                                  isFavourite: !item.isFavourite,
                                );
                                ref
                                    .watch(itemListControllerProvider.notifier)
                                    .updateItem(
                                      item.copyWith(
                                        isFavourite: !item.isFavourite,
                                      ),
                                    );
                              },
                              icon: Icon(
                                Icons.star,
                                color: item.isFavourite
                                    ? Colors.yellow
                                    : Colors.grey,
                              ),),
                        ),
                      ],
                    ),
                  ),
                  ProductTitleWithImage(item: item),
                ],
              ),
            ),
          ],
        ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${item.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Hero(
                  tag: "${item.id}",
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
