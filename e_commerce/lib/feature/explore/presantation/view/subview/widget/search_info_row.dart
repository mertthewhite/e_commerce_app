import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class SearchInfoRow extends StatelessWidget {
  const SearchInfoRow({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          meal.strMeasure6 ?? '',
          style: const TextStyle(
            color: Color(0xFF7C7C7C),
            fontFamily: "Gilroy-Medium",
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        const Text(
          ",",
          style: TextStyle(
            color: Color(0xFF7C7C7C),
            fontFamily: "Gilroy-Medium",
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        Text(
          meal.strMeasure2 ?? '',
          style: context.textTheme.headlineLarge?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: const Color(0xFF7C7C7C),
            fontFamily: "Gilroy-Medium",
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
