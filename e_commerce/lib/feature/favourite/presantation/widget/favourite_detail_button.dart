import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteDetailButton extends StatelessWidget {
  final int index;
  const FavouriteDetailButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          final List<MealModel?> favourites =
              context.read<FavouriteBloc>().state.favourites;
          for (int index = 0; index < favourites.length; index++) {
            context.read<CartBloc>().add(
                  AddToHiveCartEvent(
                    favourites[index]!,
                  ),
                );
            print(favourites);
          }

          print(context.read<FavouriteBloc>().state.favourites);
        },
        child: Container(
          height: context.dynamicHeight(0.09),
          width: context.dynamicWidth(0.89),
          decoration: BoxDecoration(
            color: const Color(0xff53B175),
            borderRadius: BorderRadius.circular(19),
          ),
          child: Padding(
            padding:
                context.paddingAllDefault + context.paddingVerticalLow * 0.7,
            child: Center(
              child: Text(
                "Add All To Cart",
                style: context.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
