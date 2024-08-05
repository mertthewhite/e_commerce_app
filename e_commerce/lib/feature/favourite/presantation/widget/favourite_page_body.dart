import 'package:e_commerce/feature/favourite/presantation/widget/favourite_card_widget.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouritePageBody extends StatelessWidget {
  const FavouritePageBody({
    super.key,
    required this.context,
    required this.favouriteMeal,
  });

  final BuildContext context;
  final List<MealModel> favouriteMeal;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomDivider(),
      SizedBox(height: context.dynamicHeight(1.5), child: SizedBox()),
    ]);
  }
}
