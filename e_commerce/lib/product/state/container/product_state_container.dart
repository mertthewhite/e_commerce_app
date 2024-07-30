import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/search_bloc.dart';
import 'package:e_commerce/product/context/bottom_nav_context.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/router/app_router.dart';
import 'package:get_it/get_it.dart';

abstract class CustomLocator {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  /// Responsible for registering all the dependencies
  static Future<void> locateServices() async {
    _instance
      ..registerLazySingleton(() => ApiService())
      ..registerFactory(() => HomeBloc(
            _instance(),
          ))
      ..registerFactory(() => ExploreBloc(
            _instance(),
          ))
      ..registerFactory(() => CartBloc())
      ..registerFactory(() => FavouriteBloc())
      ..registerFactory(() => SearchBloc(
            _instance(),
          ))
      ..registerLazySingleton(() => AppRouter())
      ..registerLazySingleton(() => HiveDatabaseManager())
      ..registerFactory(() => GeneralRepository(
            apiService: _instance(),
          ))
      // Client Dependencies
      ..registerFactory(BottomNavContext.new);

    // Initialize Clients
  }

  static T read<T extends Object>() => _instance<T>();
}
