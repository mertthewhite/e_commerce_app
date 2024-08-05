import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:flutter/material.dart';

class ExplorePageCategorCard extends StatelessWidget {
  const ExplorePageCategorCard({
    required this.state,
    required this.index,
    required this.onTap,
    required this.color,
    required this.borderColor,
    required this.image,
    super.key,
  });
  final ExploreState state;
  final int index;
  final VoidCallback? onTap;
  final Color color;
  final Color borderColor;
  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: context.dynamicHeight(NumberConstants.zeroPointZeroTwo),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: context.borderRadiusCircular18,
          color: color,
        ),
        child: Column(
          children: [
            IngredientThumbnail(
              cart: false,
              ingredient: state.mealCategoryModel[index].strCategory,
              bigImage: false,
              index: index,
            ),
            Text(
              state.mealCategoryModel[index].strCategory,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
