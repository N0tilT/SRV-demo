import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/load_favourite_items.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_state.dart';
import 'package:srv_demo/injection_container.dart';

final favouriteItemListControllerProvider =
    StateNotifierProvider<FavouriteItemListController, ItemListState>((ref) {
  return sl<FavouriteItemListController>();
});

class FavouriteItemListController extends StateNotifier<ItemListState> {
  final LoadFavouriteItems loadItems;

  FavouriteItemListController(super.state, {required this.loadItems});

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
}
