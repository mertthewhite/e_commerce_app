import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SearchInfoRow extends StatelessWidget {
  const SearchInfoRow({
    required this.meal,
    super.key,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          meal.strMeasure6 ?? '',
          style: context.textTheme.bodySmall?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: ColorConstants.lightGreyColor,
          ),
        ),
        Text(
          ",",
          style: context.textTheme.bodySmall?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: ColorConstants.lightGreyColor,
          ),
        ),
        Text(
          meal.strMeasure2 ?? '',
          style: context.textTheme.bodySmall?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: ColorConstants.lightGreyColor,
          ),
        ),
      ],
    );
  }
}
