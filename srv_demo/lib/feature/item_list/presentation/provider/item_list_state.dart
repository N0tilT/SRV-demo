import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srv_demo/feature/item_list/domain/entities/item_entity.dart';

part 'item_list_state.freezed.dart';

@freezed
class ItemListState with _$ItemListState {
  const factory ItemListState.init() = _Initial;
  const factory ItemListState.success(List<ItemEntity> account) = _Success;
  const factory ItemListState.fail(String? errorMessage) = _Fail;
}
