import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/load_items.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/update_item.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/update_item_list.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_state.dart';
import 'package:srv_demo/injection_container.dart';

final itemListControllerProvider =
    StateNotifierProvider<ItemListController, ItemListState>((ref) {
  return sl<ItemListController>();
});

class ItemListController extends StateNotifier<ItemListState> {
  final LoadItems load;
  final UpdateItemList updateItemList;
  final UpdateItem update;

  ItemListController(
    super.state, {
    required this.load,
    required this.updateItemList,
    required this.update,
  });

  Future<Either<String, List<ItemEntity>>> loadItems() async {
    // ignore: void_checks
    final result = await load.call(() {});
    return result.fold(
      (l) {
        state = ItemListState.fail(l.message);
        return Left(l.message);
      },
      (r) {
        state = ItemListState.success(r);
        return Right(r);
      },
    );
  }

  Future<Either<String, void>> updateList(List<ItemEntity> items) async {
    final result = await updateItemList.call(items);
    return result.fold(
      (l) {
        state = ItemListState.fail(l.message);
        return Left(l.message);
      },
      (r) {
        state = ItemListState.success(items);
        return Right(r);
      },
    );
  }

  Future<Either<String, void>> updateItem(ItemEntity item) async {
    final result = await update.call(item);
    return result.fold(
      (l) {
        state = ItemListState.fail(l.message);
        return Left(l.message);
      },
      (r) {
        return Right(r);
      },
    );
  }
}
