import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/widget/meal_widget.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageGroceriesRow extends StatelessWidget {
  final HomeState state;
  final List<int> randomIndex;
  const HomePageGroceriesRow({
    required this.state,
    super.key,
    required this.randomIndex,
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
              style: context.textTheme.headlineLarge?.copyWith(
                color: const Color(0xFF181725),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const HorizontalSpace.small(),
            InkWell(
              onTap: () {
                GoRouter.of(context).push('/all_product_page');
              },
              child: Text(
                "See all",
                style: context.textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF53B175),
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        VerticalSpace.small(),
        SizedBox(
          height: context.dynamicHeight(0.15),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 1,
              mainAxisSpacing: 16,
              childAspectRatio: 0.45,
            ),
            itemCount: state.meals.length > 10 ? 5 : state.meals.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.44,
                decoration: BoxDecoration(
                  color: Color(0xffF8A44C).withOpacity(0.25),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: context.paddingVerticalDefault,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                              imageUrl: state.meals[index].strMealThumb ?? ''),
                        ),
                        Text(
                          state.meals[index].strMeal ?? '',
                          style: context.textTheme.headlineLarge?.copyWith(
                            color: const Color(0xFF3E423F),
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        )
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
              crossAxisSpacing: 10,
              crossAxisCount: 1,
              mainAxisSpacing: 16,
              childAspectRatio:
                  MediaQuery.of(context).size.height < 730 ? 1.5 : 1.78,
            ),
            itemCount: state.meals.length > 10 ? 5 : state.meals.length,
            itemBuilder: (context, index) {
              return MealWidget(
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
