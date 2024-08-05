import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/all_product_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/duration_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart' as gen;
import 'package:e_commerce/product/utility/size/index.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sub_view_widget/all_product_page_widget/filter_bottom_sheet.dart';
part 'sub_view_widget/all_product_page_widget/all_product_info_row.dart';
part 'sub_view_widget/all_product_page_widget/product_card.dart';
part 'sub_view_widget/all_product_page_widget/custom_button.dart';
part 'sub_view_widget/all_product_page_widget/action_show_modal_bottom_sheet.dart';

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
                crossAxisSpacing: NumberConstants.ten,
                crossAxisCount: NumberConstants.twoInt,
                mainAxisSpacing: NumberConstants.nineteen,
                childAspectRatio: NumberConstants.zeroPointSix,
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
