import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/view/subview/widget/animated_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';

class ExploreCategoryDetailPage extends StatefulWidget {
  final List<String> selectedFilters;

  const ExploreCategoryDetailPage({required this.selectedFilters});

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
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Filtered Products',
              style: context.textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF000000),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
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
