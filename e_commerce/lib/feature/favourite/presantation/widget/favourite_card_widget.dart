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

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    required this.favouriteMeal,
    required this.index,
  });
  final List<MealModel> favouriteMeal;
  final int index;

  @override
  Widget build(BuildContext context) {
    context.read<FavouriteBloc>().add(IndexFavouriteEvent(index));

    return Padding(
      padding: context.paddingHorizontalLow,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width:
                        context.dynamicWidth(NumberConstants.zeroPointTwoFive),
                    child: IngredientThumbnail(
                      cart: false,
                      bigImage: false,
                      ingredient:
                          favouriteMeal[index].strIngredient2.toString(),
                    ),
                  ),
                  HorizontalSpace.xSmall(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width:
                            context.dynamicWidth(NumberConstants.zeroPointFour),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                favouriteMeal[index].strIngredient2.toString(),
                                style: context.textTheme.bodyMedium?.copyWith(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalSpace.xxSmall(),
                      Container(
                        width:
                            context.dynamicWidth(NumberConstants.zeroPointFour),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                favouriteMeal[index].strMeasure6 ?? '',
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
                                  favouriteMeal[index].strMeasure2 ?? '',
                                  style: context.textTheme.labelSmall?.copyWith(
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
                        "\$${favouriteMeal[index].price}",
                        style: context.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF181725),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          /*context
                          .read<FavouriteBloc>()
                          .add(RemoveFromFavouriteEvent(favouriteMeal[index]));*/
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                          color: ColorConstants.blackColor,
                          size: NumberConstants.twentyfive,
                        ),
                      ),
                    ],
                  ),
                  /*Text(
                    "rating : ${context.read<FavouriteBloc>().state.favourites}",
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: ColorConstants.lightGreyColor,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )*/
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
    );
  }
}
