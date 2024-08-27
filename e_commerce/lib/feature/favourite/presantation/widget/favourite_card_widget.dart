import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({
    super.key,
    required this.favouriteMeal,
    required this.index,
  });

  final List<MealModel> favouriteMeal;
  final int index;

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    context.read<FavouriteBloc>().add(IndexFavouriteEvent(widget.index));

    return Dismissible(
      key: Key(widget.favouriteMeal[widget.index].idMeal ?? ""),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        final removedMeal = widget.favouriteMeal[widget.index];

        context
            .read<FavouriteBloc>()
            .add(RemoveFromFavouriteEvent(removedMeal));

        context.read<FavouriteBloc>().add(
              RemoveFromFavouriteEvent(widget.favouriteMeal[widget.index]),
            );

        /*ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorConstants.lightGreenColor,
            content: Text('${removedMeal.strIngredient2} silindi.'),
            action: SnackBarAction(
              label: 'Geri Al',
              textColor: ColorConstants.whiteColor,
              onPressed: () {
                BlocProvider.of<CartBloc>(context)
                    .add(AddToCartEvent(removedMeal));
              },
            ),
          ),
        );*/
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      child: Padding(
        padding: context.paddingHorizontalLow,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: context
                          .dynamicWidth(NumberConstants.zeroPointTwoFive),
                      child: IngredientThumbnail(
                        cart: false,
                        bigImage: false,
                        ingredient: widget
                            .favouriteMeal[widget.index].strIngredient2
                            .toString(),
                      ),
                    ),
                    HorizontalSpace.xSmall(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: context
                              .dynamicWidth(NumberConstants.zeroPointFour),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  widget.favouriteMeal[widget.index]
                                      .strIngredient2
                                      .toString(),
                                  style:
                                      context.textTheme.bodyMedium?.copyWith(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpace.xxSmall(),
                        Container(
                          width: context
                              .dynamicWidth(NumberConstants.zeroPointFour),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  widget.favouriteMeal[widget.index]
                                          .strMeasure6 ??
                                      '',
                                  style: context.textTheme.labelSmall?.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: ColorConstants.lightGreyColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                ",",
                                style: context.textTheme.labelSmall?.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  color: ColorConstants.lightGreyColor,
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    widget.favouriteMeal[widget.index]
                                            .strMeasure2 ??
                                        '',
                                    style:
                                        context.textTheme.labelSmall?.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      color: ColorConstants.lightGreyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$${widget.favouriteMeal[widget.index].price}",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF181725),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Detay sayfasına git veya başka bir işlem yap
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_right,
                            color: ColorConstants.blackColor,
                            size: NumberConstants.twentyfive,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: context.paddingHorizontalDefault,
              child: const CustomDivider(),
            ),
          ],
        ),
      ),
    );
  }
}
