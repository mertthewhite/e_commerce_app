import 'package:dio/dio.dart';
import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/data/datasources/remote/meal_remote_datasource.dart';
import 'package:e_commerce/feature/explore/data/repositories/meal_repository_impl.dart';
import 'package:e_commerce/feature/explore/domain/repositories/meal_repository.dart';
import 'package:e_commerce/feature/explore/domain/usecases/uc_get_meal.dart';
import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/datasources/remote/meal_remote_datasource.dart';
import 'package:e_commerce/feature/home/data/remote/product_remote_datasource.dart';
import 'package:e_commerce/feature/home/data/repositories/meal_repository_impl.dart';
import 'package:e_commerce/feature/home/domain/repositories/meal_repository.dart';
import 'package:e_commerce/feature/home/domain/usecases/uc_get_meal.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/search_bloc.dart';
import 'package:e_commerce/product/context/bottom_nav_context.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/network/manager/network_client.dart';
import 'package:e_commerce/product/router/app_router.dart';
import 'package:get_it/get_it.dart';

abstract class CustomLocator {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  /// Responsible for registering all the dependencies
  static Future<void> locateServices({
    required String baseUrl,
  }) async {
    _instance
      ..registerFactory(() => HomeBloc(
            _instance(),
          ))
      ..registerFactory(() => ExploreBloc(
            _instance(),
          ))
      ..registerFactory(CartBloc.new)
      ..registerFactory(FavouriteBloc.new)
      ..registerFactory(() => SearchBloc(
            _instance(),
          ))
      ..registerLazySingleton(AppRouter.new)
      ..registerLazySingleton(HiveDatabaseManager.new)

      ///
      ..registerFactory<MealRepository>(
        () => MealRepositoryImpl(dataSource: _instance()),
      )
      ..registerFactory(() => UCGetMeal(
            repository: _instance(),
          ))
      ..registerFactory<MealRemoteDatasource>(
        () => MealRemoteDataSourceImpl(networkClient: _instance()),
      )
      ..registerLazySingleton(
          () => NetworkClient(dio: _instance(), baseUrl: baseUrl))
      ..registerFactory(Dio.new)

      ////
      ///
      ///
      ..registerFactory<MealCategoryNameRepository>(
        () => MealCategoryNameRepositoryImpl(dataSource: _instance()),
      )
      ..registerFactory(() => UCGetMealCategoryName(
            repository: _instance(),
          ))
      ..registerFactory<MealCategoryNameRemoteDatasource>(
        () => MealCategoryNameRemoteDataSourceImpl(networkClient: _instance()),
      )

      ///

      // Client Dependencies
      ..registerFactory(BottomNavContext.new);

    // Initialize Clients
  }

  static T read<T extends Object>() => _instance<T>();
}
