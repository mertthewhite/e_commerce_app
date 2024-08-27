import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/landing/presantation/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin LandingPageMixin on State<LandingPage> {
  @override
  initState() {
    super.initState();
    context.read<FavouriteBloc>().add(const LoadFavouritesEvent());
    context.read<HomeBloc>().add(const FecthNewMeal());
    fecthMeal();
  }

  Future<void> fecthMeal() async {
    print(context.read<HomeBloc>().state.meals);
    print("fetching meals");
  }

  final ValueNotifier<bool> navigatedNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    navigatedNotifier.dispose();
    super.dispose();
  }
}
