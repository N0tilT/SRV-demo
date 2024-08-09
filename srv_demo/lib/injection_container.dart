import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srv_demo/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:srv_demo/feature/auth/data/models/account_model.dart';
import 'package:srv_demo/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:srv_demo/feature/auth/domain/repositories/auth_repository.dart';
import 'package:srv_demo/feature/auth/domain/usecases/auth.dart';
import 'package:srv_demo/feature/auth/domain/usecases/get_profile.dart';
import 'package:srv_demo/feature/auth/domain/usecases/logout.dart';
import 'package:srv_demo/feature/auth/presentation/provider/auth_state.dart';
import 'package:srv_demo/feature/auth/presentation/provider/user_controller.dart';
import 'package:srv_demo/feature/item_list/data/datasources/item_local_data_source.dart';
import 'package:srv_demo/feature/item_list/data/models/item_model.dart';
import 'package:srv_demo/feature/item_list/data/repositories/item_repository_impl.dart';
import 'package:srv_demo/feature/item_list/domain/repositories/items_repository.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/load_favorite_items.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/load_items.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/update_item.dart';
import 'package:srv_demo/feature/item_list/domain/usecases/update_item_list.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/favorite_item_list_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_controller.dart';
import 'package:srv_demo/feature/item_list/presentation/provider/item_list_state.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  Hive.registerAdapter(AccountModelAdapter());
  Hive.registerAdapter(ItemModelAdapter());

  sl.registerFactory(
    () => UserController(
      const AuthState.init(),
      auth: sl(),
      get: sl(),
      logoutCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => Auth(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetProfile(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => Logout(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localDataSource: sl()),
  );

  sl.registerLazySingletonAsync<AuthLocalDataSource>(() async {
    return AuthLocalDataSourceImpl(
      prefs: prefs,
    );
  });

  await sl.isReady<AuthLocalDataSource>();

  sl.registerFactory(
    () => ItemListController(
      const ItemListState.init(),
      load: sl(),
      updateItemList: sl(),
      update: sl(),
    ),
  );
  sl.registerFactory(
    () => FavoriteItemListController(
      const ItemListState.init(),
      loadItems: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadItems(
      itemsRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadFavoriteItems(
      itemsRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => UpdateItemList(
      itemsRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => UpdateItem(
      itemsRepository: sl(),
    ),
  );

  sl.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingletonAsync<ItemLocalDataSource>(
    () async {
      return ItemLocalDataSourceImpl(
        itemBox: await Hive.openBox<ItemModel>('ItemBox'),
      );
    },
  );
  await sl.isReady<ItemLocalDataSource>();
}
