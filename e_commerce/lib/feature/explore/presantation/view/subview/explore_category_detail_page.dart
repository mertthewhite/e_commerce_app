import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/view/subview/widget/animated_product_item.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCategoryDetailPage extends StatefulWidget {
  const ExploreCategoryDetailPage({
    required this.selectedFilters,
    super.key,
  });
  final List<String> selectedFilters;

  @override
  State<ExploreCategoryDetailPage> createState() =>
      _ExploreCategoryDetailPageState();
}

class _ExploreCategoryDetailPageState extends State<ExploreCategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final filteredMeals = state.meals.where((meal) {
          return widget.selectedFilters.isEmpty ||
              widget.selectedFilters.any((filter) =>
                  meal.strCategory
                      ?.toLowerCase()
                      .contains(filter.toLowerCase()) ??
                  false);
        }).toList();

        return Scaffold(
          appBar: const CustomGeneralAppBar(title: 'Category Detail'),
          body: Padding(
            padding: context.paddingAllDefault,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: NumberConstants.ten,
                crossAxisCount: NumberConstants.twoInt,
                mainAxisSpacing: NumberConstants.nineteen,
                childAspectRatio: NumberConstants.zeroPointSix,
              ),
              itemCount: filteredMeals.length,
              itemBuilder: (context, index) {
                final meal = filteredMeals[index];
                return AnimatedProductItem(
                  isTapped: false,
                  meal: meal,
                  onTap: () {
                    context.read<CartBloc>().add(AddToHiveCartEvent(meal));
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
