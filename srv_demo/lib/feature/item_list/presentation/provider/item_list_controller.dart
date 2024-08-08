import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/load_favourite_items.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/load_items.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/update_item_list.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_state.dart';
import 'package:srv_demo/injection_container.dart';

final itemListControllerProvider =
    StateNotifierProvider<ItemListController, ItemListState>((ref) {
  return sl<ItemListController>();
});

class ItemListController extends StateNotifier<ItemListState> {
  final LoadItems loadItems;
  final UpdateItemList updateItemList;

  ItemListController(
    super.state, {
    required this.loadItems,
    required this.updateItemList,
  });

  Future<Either<String, List<ItemEntity>>> load() async {
    final result = await loadItems.call(() {});
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

  Future<Either<String, void>> update(List<ItemEntity> items) async {
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
}
