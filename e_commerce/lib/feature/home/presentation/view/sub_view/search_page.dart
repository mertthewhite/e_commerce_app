import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/search_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGeneralAppBar(title: 'Search', showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: context.paddingAllDefault,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.containerBackground,
                borderRadius: context.borderRadiusCircular10,
              ),
              child: TextField(
                style: context.textTheme.bodySmall,
                textAlignVertical: TextAlignVertical.center,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: context.textTheme.bodySmall?.copyWith(
                    color: ColorConstants.lightGreyColor,
                  ),
                  prefixIcon: Padding(
                    padding: context.paddingAllDefault,
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: ColorConstants.lightGreyColor,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : hasError
                    ? Center(
                        child: Text('Error: $errorMessage'),
                      )
                    : ListView.builder(
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
                            child: MealListItem(
                              image: image,
                              meal: meal,
                              onTap: (meal) {
                                context
                                    .read<CartBloc>()
                                    .add(AddToHiveCartEvent(meal));
                              },
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

class MealListItem extends StatefulWidget {
  const MealListItem({
    Key? key,
    required this.meal,
    required this.onTap,
    required this.image,
    this.isTapped = false,
  }) : super(key: key);
  final MealModel meal;
  final bool isTapped;
  final void Function(MealModel)? onTap;
  final List<String> image;

  @override
  _MealListItemState createState() => _MealListItemState();
}

class _MealListItemState extends State<MealListItem> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow + context.paddingHorizontalLow,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: IngredientThumbnail(
                      cart: false,
                      ingredient: widget.meal.strIngredient2.toString(),
                      bigImage: false,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.dynamicWidth(0.4),
                        child: Text(
                          widget.meal.strIngredient2 ?? '',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: const Color(0xFF000000),
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SearchInfoRow(meal: widget.meal),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isTapped = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isTapped = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _isTapped = false;
                  });
                },
                onTap: () {
                  widget.onTap?.call(widget.meal);
                },
                child: AnimatedScale(
                  scale: _isTapped ? 0.7 : 1.0,
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
        ),
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
    return Container(
      width: context.dynamicWidth(0.5),
      child: Row(
        children: [
          Text(
            meal.strMeasure6 ?? '',
            style: const TextStyle(
              color: ColorConstants.lightGreyColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const Text(
            ",",
            style: TextStyle(
              color: ColorConstants.lightGreyColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              meal.strMeasure2 ?? '',
              style: context.textTheme.headlineLarge?.copyWith(
                overflow: TextOverflow.ellipsis,
                color: ColorConstants.lightGreyColor,
                fontFamily: "Gilroy-Medium",
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
