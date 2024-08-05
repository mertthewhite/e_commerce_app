import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/widget/meal_widget.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageBestSallerRow extends StatelessWidget {
  final HomeState state;
  final List<int> randomIndices;
  final List<String> image;
  const HomePageBestSallerRow({
    required this.randomIndices,
    required this.state,
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Best Selling",
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push('/all_product_page');
              },
              child: Text(
                "See all",
                style: context.textTheme.bodySmall?.copyWith(
                  color: ColorConstants.lightGreenColor,
                ),
              ),
            ),
          ],
        ),
        const VerticalSpace.small(),
        SizedBox(
          height: context.dynamicHeight(NumberConstants.zeroPointThreeFive),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: NumberConstants.sixteen,
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
                productName:
                    state.meals[randomIndices[index]].strIngredient2 ?? '',
                model: state.meals[randomIndices[index]],
                firstMeasure:
                    state.meals[randomIndices[index]].strMeasure1 ?? '',
                secondMeasure:
                    state.meals[randomIndices[index]].strMeasure2 ?? '',
                ingredient:
                    state.meals[randomIndices[index]].strIngredient2 ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
