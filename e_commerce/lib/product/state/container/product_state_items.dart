import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/product/context/bottom_nav_context.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/router/app_router.dart';
import 'package:e_commerce/product/state/container/product_state_container.dart';

class ProductStateItems {
  const ProductStateItems._();
  //static ProductCache get productCache => ProductContainer.read<ProductCache>();
  static AppRouter get appRouter => CustomLocator.read<AppRouter>();
  static HomeBloc get homeBloc => CustomLocator.read<HomeBloc>();
  static ExploreBloc get exploreBloc => CustomLocator.read<ExploreBloc>();
  static CartBloc get cartBloc => CustomLocator.read<CartBloc>();
  static FavouriteBloc get favouriteBloc => CustomLocator.read<FavouriteBloc>();
  static Connectivity get connectivity => CustomLocator.read<Connectivity>();
  static HiveDatabaseManager get hiveDatabaseManager =>
      CustomLocator.read<HiveDatabaseManager>();
  static BottomNavContext get bottomNavBuilder =>
      CustomLocator.read<BottomNavContext>();
}
