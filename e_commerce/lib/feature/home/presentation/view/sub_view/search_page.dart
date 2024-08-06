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

part 'sub_view_widget/search_page_widget/search_info_row.dart';
part 'sub_view_widget/search_page_widget/search_list_item.dart';
part 'sub_view_widget/search_page_widget/search_bar_widget.dart';

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
          SearchBar(
            onSearchChanged: onSearchChanged,
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
