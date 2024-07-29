import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/landing/presantation/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin LandingPageMixin on State<LandingPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FetchAllMeals());
    BlocProvider.of<ExploreBloc>(context).add(FetchExploreCategory());
    context.read<FavouriteBloc>().add(LoadFavouritesEvent());
    context.read<ExploreBloc>().add(FetchExploreCategory());
  }

  final ValueNotifier<bool> navigatedNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    navigatedNotifier.dispose();
    super.dispose();
  }

  bool navigated = false;
}
