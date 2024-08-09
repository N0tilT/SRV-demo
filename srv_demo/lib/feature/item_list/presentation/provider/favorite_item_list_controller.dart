import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/load_favorite_items.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_state.dart';
import 'package:srv_demo/injection_container.dart';

final favoriteItemListControllerProvider =
    StateNotifierProvider<FavoriteItemListController, ItemListState>((ref) {
  return sl<FavoriteItemListController>();
});

class FavoriteItemListController extends StateNotifier<ItemListState> {
  final LoadFavoriteItems loadItems;

  FavoriteItemListController(super.state, {required this.loadItems});

  Future<Either<String, List<ItemEntity>>> load() async {
    // ignore: void_checks
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
}
