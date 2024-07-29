import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ExplorePageCategorCard extends StatelessWidget {
  final HomeState state;
  final int index;
  final VoidCallback? onTap;
  final Color color;
  final Color borderColor;

  ExplorePageCategorCard({
    super.key,
    required this.state,
    required this.onTap,
    required this.index,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: context.dynamicHeight(0.02),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Column(
          children: [
            IngredientThumbnail(
              cart: false,
              ingredient: state.meals[index].strIngredient1.toString(),
              bigImage: false,
            ),
            Text(
              state.meals[index].strCategory.toString(),
              style: context.textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF000000),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
