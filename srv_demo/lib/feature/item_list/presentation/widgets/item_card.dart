import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_controller.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.press});

  final ItemEntity item;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${item.id}",
                child: Image.asset(item.image),
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                // products is out demo list
                item.title,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                "${item.price} ₽",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Consumer(
                builder: (context, ref, child) => IconButton(
                  onPressed: () {
                    ref.watch(itemListControllerProvider.notifier).updateItem(
                          item.copyWith(isFavorite: !item.isFavorite),
                        );
                  },
                  icon: Icon(
                    Icons.star,
                    color: item.isFavorite ? Colors.yellow : Colors.grey,
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
