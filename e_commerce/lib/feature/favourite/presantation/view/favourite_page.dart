import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/fav_button.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/favourite_card_widget.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:e_commerce/product/widget/empty_widget/emty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGeneralAppBar(
        divider: true,
        title: 'Favourites',
        showBackButton: false,
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          final favouriteMeal = <MealModel>[...state.favourites.toSet()];
          context.read<FavouriteBloc>().state.favourites;
          if (favouriteMeal.isEmpty) {
            return const CustomEmtyWidget(
              isCart: false,
              isFavourite: true,
            );
          }

          return Stack(
            children: [
              ListView.builder(
                itemCount: favouriteMeal.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        '/product_detail_page',
                        extra: {'selectedProduct': favouriteMeal[index]},
                      );
                    },
                    child: FavouriteCard(
                      favouriteMeal: favouriteMeal,
                      index: index,
                    ),
                  );
                },
              ),
              const FavButton()
            ],
          );
        },
      ),
    );
  }
}
