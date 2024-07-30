import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/search_bloc.dart';
import 'package:e_commerce/product/state/container/product_state_items.dart';
import 'package:e_commerce/product/theme/notifier/theme_notifer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => ProductStateItems.homeBloc),
        BlocProvider<ExploreBloc>(
            create: (context) => ProductStateItems.exploreBloc),
        BlocProvider<CartBloc>(create: (context) => ProductStateItems.cartBloc),
        BlocProvider<FavouriteBloc>(
            create: (context) => ProductStateItems.favouriteBloc),
        BlocProvider<SearchBloc>(
            create: (context) => ProductStateItems.searchBloc),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: child,
      ),
    );
  }
}
