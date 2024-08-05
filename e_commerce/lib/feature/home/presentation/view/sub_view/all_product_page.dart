import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/all_product_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> with AllProductMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final filteredMeals = state.meals.where((meal) {
          return selectedFiltered.isEmpty ||
              selectedFiltered.any((filter) =>
                  meal.strCategory
                      ?.toLowerCase()
                      .contains(filter.toLowerCase()) ??
                  false);
        }).toList();

        return Scaffold(
          appBar: CustomGeneralAppBar(
            title: 'All Products',
            actions: [
              ActionShowModalBottomSheet(onFilterTap: openFilterBottomSheet),
              const HorizontalSpace.xSmall(),
            ],
          ),
          body: Padding(
            padding: context.paddingAllDefault,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 19,
                childAspectRatio: 0.63,
              ),
              itemCount: filteredMeals.length,
              itemBuilder: (context, index) {
                final meal = filteredMeals[index];
                return ProductCard(
                  meal: meal,
                  image: image,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class ProductCard extends StatefulWidget {
  final List<String> image;
  final MealModel meal;

  const ProductCard({
    Key? key,
    required this.image,
    required this.meal,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          '/product_detail_page',
          extra: {'selectedProduct': meal},
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFE2E2E2),
          ),
        ),
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IngredientThumbnail(
                cart: false,
                ingredient: meal.strIngredient2.toString(),
                bigImage: false,
              ),
              Text(
                meal.strIngredient2 ?? '',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF000000),
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              AllProductInfoRow(meal: meal),
              VerticalSpace.xSmall(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${meal.price}',
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF181725),
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
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
                      context.read<CartBloc>().add(AddToHiveCartEvent(meal));
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
            ],
          ),
        ),
      ),
    );
  }
}

class AllProductInfoRow extends StatelessWidget {
  const AllProductInfoRow({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            overflow: TextOverflow.ellipsis,
            meal.strMeasure6 ?? '',
            style: const TextStyle(
              color: ColorConstants.lightGreyColor,
              fontFamily: "Gilroy-Medium",
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        const Text(
          ",",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ColorConstants.lightGreyColor,
            fontFamily: "Gilroy-Medium",
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        Flexible(
          child: Text(
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
    );
  }
}

class ActionShowModalBottomSheet extends StatelessWidget {
  final VoidCallback onFilterTap;

  const ActionShowModalBottomSheet({
    super.key,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onFilterTap,
      child: SvgPicture.asset(
        'assets/icons/filter.svg',
        width: 20,
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  final List<String> selectedFilters;

  const FilterBottomSheet({Key? key, required this.selectedFilters})
      : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> options = [
    'Vegetarian',
    'Side',
    'Seafood',
    'Dessert',
    'Fast Food',
    'Beef',
    'Pasta',
    'Wine'
  ];
  final List<String> headers = ['Categories', 'Brand'];
  late Map<String, bool> selectedOptions;

  @override
  void initState() {
    super.initState();
    selectedOptions = {
      for (var option in options)
        option: widget.selectedFilters.contains(option)
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: context.paddingHorizontalDefault,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cancel.svg',
                        width: 15,
                        color: const Color(0xFF181725),
                      ),
                    ),
                    const HorizontalSpace.small(),
                    const Text(
                      'Filters',
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontFamily: "Gilroy-Bold",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const HorizontalSpace.xLarge(),
                  ],
                ),
              ),
              const VerticalSpace.small(),
              Container(
                height: MediaQuery.of(context).size.height * 0.87,
                decoration: const BoxDecoration(
                  color: ColorConstants.containerBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < options.length; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (i % 4 == 0)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  headers[i ~/ 4],
                                  style: const TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "Gilroy",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOptions[options[i]] =
                                      !selectedOptions[options[i]]!;
                                });
                                print(
                                    '${options[i]} selected: ${selectedOptions[options[i]]}');
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 19,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    activeColor: ColorConstants.lightGreenColor,
                                    checkColor: Colors.white,
                                    side: const BorderSide(
                                        color: Color(0xffB1B1B1)),
                                    value: selectedOptions[options[i]],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedOptions[options[i]] = value!;
                                      });
                                      print(
                                          '${options[i]} selected: ${selectedOptions[options[i]]}');
                                    },
                                  ),
                                  Text(
                                    options[i],
                                    style: TextStyle(
                                      color: selectedOptions[options[i]]!
                                          ? const Color(0xff53B175)
                                          : const Color(0xFF000000),
                                      fontFamily: "Gilroy-Medium",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      CustomAllButton(
                        text: 'Apply',
                        height: context.dynamicHeight(0.08),
                        onTap: () {
                          print(selectedOptions.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList());
                          Navigator.pop(
                            context,
                            selectedOptions.entries
                                .where((entry) => entry.value)
                                .map((entry) => entry.key)
                                .toList(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomAllButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double? height;
  final double? width;

  const CustomAllButton({
    super.key,
    this.onTap,
    required this.text,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? context.dynamicHeight(0.11),
          width: width ?? context.dynamicWidth(0.89),
          decoration: BoxDecoration(
            color: ColorConstants.lightGreenColor,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Padding(
            padding: context.paddingAllDefault,
            child: Center(
              child: Text(
                text,
                style: context.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterStorage {
  static const _filterKey = 'selected_filters';

  Future<void> saveFilters(List<String> filters) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_filterKey, filters);
  }

  Future<List<String>> loadFilters() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_filterKey) ?? [];
  }
}
