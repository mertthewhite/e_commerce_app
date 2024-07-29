import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/custom_app_bar.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/empty_widget.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/fav_button.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/favourite_page_body.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  var index;

  @override
  Widget build(BuildContext context) {
    if (context.read<FavouriteBloc>().state.favourites.isEmpty) {
      return const EmptyWidget();
    }
    return Scaffold(
      appBar: const CustomAppBar(title: "Favourites"),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          final favouriteMeal = <MealModel>[...state.favourites.toSet()];
          return Stack(children: [
            SingleChildScrollView(
              child: FavouritePageBody(
                  context: context, favouriteMeal: favouriteMeal),
            ),
            const FavButton()
          ]);
        },
      ),
    );
  }
}
