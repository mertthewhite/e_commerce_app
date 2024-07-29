import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/counter_button.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
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
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.07,
          top: MediaQuery.of(context).size.height * 0.02,
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
                          width: MediaQuery.of(context).size.width * 0.27,
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
                            width: 14.21,
                          ),
                        ),
                        const VerticalSpace.medium(),
                        const VerticalSpace.xxSmall(),
                        Text(
                          "\$${meal.price}",
                          style: context.textTheme.headlineLarge?.copyWith(
                              color: const Color(0xFF181725),
                              fontFamily: "Gilroy-Bold",
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const VerticalSpace.small(),
            const Divider(
              color: Color(0xffE2E2E2),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
