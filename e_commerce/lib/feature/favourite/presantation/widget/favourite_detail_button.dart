import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
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
          height: context.dynamicHeight(NumberConstants.zeroPointZeroNine),
          width: context.dynamicWidth(NumberConstants.zeroPointEightFive),
          decoration: BoxDecoration(
            color: ColorConstants.lightGreenColor,
            borderRadius: context.borderRadiusCircular18,
          ),
          child: Padding(
            padding: context.paddingAllDefault +
                context.paddingVerticalLow * NumberConstants.zeroPointSeven,
            child: Center(
              child: Text(
                "Add All To Cart",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
