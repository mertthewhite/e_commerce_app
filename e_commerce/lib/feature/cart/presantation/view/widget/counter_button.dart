import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CounterButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.lightGreyColorDivider),
          borderRadius: context.borderRadiusCircular16,
        ),
        child: Padding(
          padding: context.paddingAllLow,
          child: Icon(
            icon,
            color: icon == Icons.add
                ? ColorConstants.lightGreenColor
                : ColorConstants.lightGreyColor,
          ),
        ),
      ),
    );
  }
}

class CartProductCounter extends StatelessWidget {
  final MealModel meal;
  final int count;

  const CartProductCounter({
    Key? key,
    required this.meal,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterButton(
          icon: Icons.remove,
          onTap: () {
            context.read<CartBloc>().add(RemoveFromCartEvent(meal));
          },
        ),
        SizedBox(
          width: context.dynamicWidth(NumberConstants.zeroPointZeroTwo),
        ),
        SizedBox(
          width: context.dynamicWidth(NumberConstants.zeroPointZeroSix),
          child: Text(
            count.toString(),
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelMedium,
          ),
        ),
        CounterButton(
          icon: Icons.add,
          onTap: () {
            context.read<CartBloc>().add(AddToHiveCartEvent(meal));
          },
        ),
      ],
    );
  }
}

class CartProductDetail extends StatelessWidget {
  final MealModel meal;

  const CartProductDetail({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.dynamicWidth(NumberConstants.zeroPointFour),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  meal.strIngredient2.toString(),
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: context.dynamicWidth(NumberConstants.zeroPointFour),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  meal.strMeasure6 ?? 'Unknown Measure',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: ColorConstants.lightGreyColor,
                  ),
                ),
              ),
              Text(
                ",",
                style: context.textTheme.labelSmall?.copyWith(
                  color: ColorConstants.lightGreyColor,
                ),
              ),
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  meal.strMeasure2 ?? 'Unknown Measure',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: ColorConstants.lightGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
