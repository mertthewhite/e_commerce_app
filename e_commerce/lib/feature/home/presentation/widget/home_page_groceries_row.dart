import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/widget/meal_widget.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageGroceriesRow extends StatelessWidget {
  final HomeState state;
  final List<int> randomIndex;
  final List<String> image;

  const HomePageGroceriesRow({
    required this.state,
    super.key,
    required this.randomIndex,
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
              "Groceries",
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const HorizontalSpace.small(),
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
            )
          ],
        ),
        VerticalSpace.small(),
        SizedBox(
          height: context.dynamicHeight(NumberConstants.zeroPointOneFive),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: NumberConstants.ten,
              crossAxisCount: NumberConstants.oneInt,
              mainAxisSpacing: NumberConstants.sixteen,
              childAspectRatio: NumberConstants.zeroPointFourFive,
            ),
            itemCount: state.meals.length > NumberConstants.ten
                ? NumberConstants.fiveInt
                : state.meals.length,
            itemBuilder: (context, index) {
              return Container(
                width: context.width * NumberConstants.zeroPointFourFive,
                decoration: BoxDecoration(
                  color: Color(0xffF8A44C)
                      .withOpacity(NumberConstants.zeroPointTwoFive),
                  borderRadius: context.borderRadiusCircular16,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: context.paddingVerticalDefault,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: context.borderRadiusCircular20,
                          child: CachedNetworkImage(
                              imageUrl: state.meals[index].strMealThumb ?? ''),
                        ),
                        Text(
                          state.meals[index].strMeal ?? '',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF3E423F),
                          ),
                        ),
                        VerticalSpace.small(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        VerticalSpace.small(),
        SizedBox(
          height: context.dynamicHeight(0.36),
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
                price: state.meals[randomIndex[index]].price,
                models: [],
                hiveManager: HiveDatabaseManager(),
                productName:
                    state.meals[randomIndex[index]].strIngredient2 ?? '',
                state: state,
                model: state.meals[randomIndex[index]],
                ingredient:
                    state.meals[randomIndex[index]].strIngredient2 ?? '',
                firstMeasure: state.meals[randomIndex[index]].strMeasure1 ?? '',
                secondMeasure:
                    state.meals[randomIndex[index]].strMeasure2 ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
