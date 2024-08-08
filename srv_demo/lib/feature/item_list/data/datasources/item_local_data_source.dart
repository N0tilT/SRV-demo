
import 'package:hive/hive.dart';
import 'package:srv_demo/core/data/error/exception.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';

abstract class ItemLocalDataSource {
  Future<List<ItemModel>> load(void request);
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
}
