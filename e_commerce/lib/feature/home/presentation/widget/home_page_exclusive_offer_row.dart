import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/widget/meal_widget.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:flutter/material.dart';

class HomePageExclusiveOfferRow extends StatelessWidget {
  final HomeState state;
  final List<String> image;

  const HomePageExclusiveOfferRow({
    required this.state,
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(NumberConstants.zeroPointThreeFive),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: NumberConstants.ten,
          crossAxisCount: NumberConstants.oneInt,
          mainAxisSpacing: NumberConstants.sixteen,
          childAspectRatio: context.height < 730 ? 1.5 : 1.78,
        ),
        itemCount: state.meals.length > NumberConstants.ten
            ? NumberConstants.fiveInt
            : state.meals.length,
        itemBuilder: (context, index) {
          return MealWidget(
            image: image,
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
