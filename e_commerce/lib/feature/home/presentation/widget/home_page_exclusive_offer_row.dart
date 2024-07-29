import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/widget/meal_widget.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class HomePageExclusiveOfferRow extends StatelessWidget {
  final HomeState state;
  const HomePageExclusiveOfferRow({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.35),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: state.meals.length > 10 ? 5 : state.meals.length,
        itemBuilder: (context, index) {
          return MealWidget(
            price: state.meals[index].price,
            models: [],
            hiveManager: HiveDatabaseManager(),
            state: state,
            productName: state.meals[index].strIngredient2 ?? '',
            model: state.meals[index],
            ingredient: state.meals[index].strIngredient2 ?? '',
            firstMeasure: state.meals[index].strMeasure1 ?? '',
            secondMeasure: state.meals[index].strMeasure2 ?? '',
          );
        },
      ),
    );
  }
}
