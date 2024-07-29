import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/widget/meal_widget.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageBestSallerRow extends StatelessWidget {
  final HomeState state;
  final List<int> randomIndices;
  const HomePageBestSallerRow({
    required this.randomIndices,
    required this.state,
    super.key,
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
                color: const Color(0xFF181725),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push('/all_product_page');
              },
              child: Text(
                "See all",
                style: context.textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF53B175),
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        const VerticalSpace.small(),
        SizedBox(
          height: context.dynamicHeight(0.35),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 14,
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
