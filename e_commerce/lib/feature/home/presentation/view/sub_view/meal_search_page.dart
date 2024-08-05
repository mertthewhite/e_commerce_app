import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/meal_search_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MealSearchPage extends StatefulWidget {
  @override
  _MealSearchPageState createState() => _MealSearchPageState();
}

class _MealSearchPageState extends State<MealSearchPage> with MealSearchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGeneralAppBar(title: 'Search'),
      body: Column(
        children: [
          Padding(
            padding: context.paddingAllDefault,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(80),
              ),
              child: TextField(
                style: context.textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF000000),
                  fontSize: 16,
                ),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (enteredKeyword) {
                  runFilter(enteredKeyword);
                  print(filteredMeals);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: context.textTheme.headlineLarge
                      ?.copyWith(color: const Color(0xFFA1A1A1), fontSize: 16),
                  prefixIcon: Padding(
                    padding: context.paddingAllDefault,
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: const Color(0xFFA1A1A1),
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMeals.length,
              itemBuilder: (context, index) {
                final meal = filteredMeals[index];
                return InkWell(
                  onTap: () {
                    GoRouter.of(context).push(
                      '/product_detail_page',
                      extra: {'selectedProduct': meal},
                    );
                  },
                  child: Padding(
                    padding:
                        context.paddingAllLow + context.paddingHorizontalLow,
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 30,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: IngredientThumbnail(
                                        cart: false,
                                        ingredient:
                                            meal.strIngredient2.toString(),
                                        bigImage: false),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        meal.strIngredient2 ?? '',
                                        style: context.textTheme.headlineMedium
                                            ?.copyWith(
                                          color: const Color(0xFF000000),
                                          fontFamily: "Gilroy",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SearchInfoRow(meal: meal),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTapDown: (_) {
                                  setState(() {
                                    isTapped = true;
                                  });
                                },
                                onTapUp: (_) {
                                  setState(() {
                                    isTapped = false;
                                  });
                                },
                                onTapCancel: () {
                                  setState(() {
                                    isTapped = false;
                                  });
                                },
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddToHiveCartEvent(meal));
                                },
                                child: AnimatedScale(
                                  scale: isTapped ? 0.7 : 1.0,
                                  duration: const Duration(milliseconds: 100),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstants.lightGreenColor,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Padding(
                                      padding: context.paddingAllDefault * 0.8,
                                      child: SvgPicture.asset(
                                        'assets/icons/plus.svg',
                                        width: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
            color: ColorConstants.lightGreyColor,
            fontFamily: "Gilroy-Medium",
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        const Text(
          ",",
          style: TextStyle(
            color: ColorConstants.lightGreyColor,
            fontFamily: "Gilroy-Medium",
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        Text(
          meal.strMeasure2 ?? '',
          style: context.textTheme.headlineLarge?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: ColorConstants.lightGreyColor,
            fontFamily: "Gilroy-Medium",
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
