import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/counter_button.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartPageCard extends StatelessWidget {
  final MealModel meal;
  final int count;

  const CartPageCard({
    Key? key,
    required this.meal,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width *
              NumberConstants.zeroPointZeroSeven,
          right: MediaQuery.of(context).size.width *
              NumberConstants.zeroPointZeroSeven,
          top: MediaQuery.of(context).size.height *
              NumberConstants.zeroPointZeroTwo,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              NumberConstants.zeroPointTwoFive,
                          child: IngredientThumbnail(
                            cart: true,
                            bigImage: false,
                            ingredient: meal.strIngredient2 ?? '',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CartProductDetail(meal: meal),
                            const VerticalSpace.xSmall(),
                            CartProductCounter(meal: meal, count: count),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<CartBloc>()
                                .add(RemoveHiveFromCartEvent(
                                  meal,
                                ));
                          },
                          child: SvgPicture.asset(
                            'assets/icons/cancel.svg',
                            width: NumberConstants.fifteen,
                          ),
                        ),
                        const VerticalSpace.medium(),
                        const VerticalSpace.xxSmall(),
                        Text(
                          "\$${meal.price}",
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const VerticalSpace.small(),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
