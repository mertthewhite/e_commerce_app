import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCard extends StatelessWidget {
  final List<MealModel> favouriteMeal;
  final int index;

  const FavouriteCard({
    Key? key,
    required this.favouriteMeal,
    required this.index,
  }) : super(key: key);

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
                    width: context.dynamicWidth(0.27),
                    child: IngredientThumbnail(
                      cart: false,
                      bigImage: false,
                      ingredient:
                          favouriteMeal[index].strIngredient2.toString(),
                    ),
                  ),
                  SizedBox(
                    width: context.dynamicWidth(0.02),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favouriteMeal[index].strIngredient2.toString(),
                        style: context.textTheme.headlineMedium?.copyWith(
                          color: const Color(0xFF000000),
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: context.dynamicHeight(0.01),
                      ),
                      Container(
                        width: context.dynamicWidth(0.4),
                        child: Row(
                          children: [
                            Text(
                              favouriteMeal[index].strMeasure6 ?? '',
                              style: const TextStyle(
                                color: Color(0xFF7C7C7C),
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text(
                              ",",
                              style: TextStyle(
                                color: Color(0xFF7C7C7C),
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                favouriteMeal[index].strMeasure2 ?? '',
                                style:
                                    context.textTheme.headlineLarge?.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  color: const Color(0xFF7C7C7C),
                                  fontFamily: "Gilroy-Medium",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
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
              Row(
                children: [
                  Text(
                    "\$${favouriteMeal[index].price}",
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF181725),
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
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
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: context.paddingHorizontalDefault,
            child: const Divider(
              color: Color(0xffE2E2E2),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
