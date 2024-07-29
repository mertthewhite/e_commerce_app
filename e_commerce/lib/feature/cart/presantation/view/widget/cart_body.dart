import 'package:e_commerce/feature/cart/presantation/view/widget/cart_page_button.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_page_card.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.addedMeals,
  });

  final Map<MealModel, int> addedMeals;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: addedMeals.length,
          itemBuilder: (BuildContext context, int index) {
            final meal = addedMeals.keys.elementAt(index);
            return CartPageCard(
              meal: meal,
              count: addedMeals[meal]!,
            );
          },
        ),
        CartPageButton(),
      ],
    );
  }
}
