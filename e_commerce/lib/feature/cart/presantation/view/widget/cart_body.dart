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
    final sortedMeals = addedMeals.entries.toList()
      ..sort((a, b) {
        final aId = a.key.idMeal ?? '';
        final bId = b.key.idMeal ?? '';
        return bId.compareTo(aId);
      });
    return Stack(
      children: [
        ListView.builder(
          itemCount: sortedMeals.length,
          itemBuilder: (BuildContext context, int index) {
            final meal = sortedMeals[index].key;
            return CartPageCard(
              meal: meal,
              count: sortedMeals[index].value,
            );
          },
        ),
        const CartPageButton(),
      ],
    );
  }
}
