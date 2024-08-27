import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/search_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/search_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/enums/view_status.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

part 'sub_view_widget/search_page_widget/search_bar_widget.dart';
part 'sub_view_widget/search_page_widget/search_info_row.dart';
part 'sub_view_widget/search_page_widget/search_list_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomGeneralAppBar(title: 'Search'),
          body: Column(
            children: [
              SearchBar(
                onSearchChanged: (value) {
                  context.read<SearchBloc>().add(FetchSearchMeals(value));
                },
              ),
              Expanded(
                child: state.searchQuery.isEmpty
                    ? const Center(
                        child: Text('Search for a meal'),
                      )
                    : state.status == ViewStatus.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : state.status == ViewStatus.failure
                            ? Center(
                                child:
                                    Text('Error Search ${state.errorMessage}'),
                              )
                            : ListView.builder(
                                itemCount: state.mealSearchModel.length,
                                itemBuilder: (context, index) {
                                  final meal = state.mealSearchModel[index];
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
      },
    );
  }
}
