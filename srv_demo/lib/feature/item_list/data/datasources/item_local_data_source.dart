import 'package:hive/hive.dart';
import 'package:srv_demo/core/data/error/exception.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';

abstract class ItemLocalDataSource {
  Future<List<ItemModel>> load(void request);
  Future<void> upload(List<ItemModel> request);
  Future<void> update(ItemModel request);
}

class ItemLocalDataSourceImpl implements ItemLocalDataSource {
  Box<ItemModel> itemBox;

  ItemLocalDataSourceImpl({
    required this.itemBox,
  });

  @override
  Future<List<ItemModel>> load(void request) async {
    try {
      return itemBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> upload(List<ItemModel> request) async {
    try {
      if (request.isEmpty) {
        itemBox.clear();
        return;
      }

      final modelList = {for (final item in request) item.id: item};
      final boxIds = itemBox.values.map((e) => e.id).toList();

      final List<int> items = [];
      items.addAll(boxIds);
      items.addAll(modelList.keys);
      final ids = {...items};
      await itemBox.putAll(
        {
          for (final id
              in modelList.keys.where((element) => ids.contains(element)))
            id: modelList[id]!,
        },
      );

      await itemBox.deleteAll([
        for (final id in ids.where(
          (element) => !modelList.keys.contains(element),
        ))
          id,
      ]);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> update(ItemModel request) async {
    try {
      await itemBox.put(request.id, request);
    } catch (e) {
      throw CacheException();
    }
  }
}
