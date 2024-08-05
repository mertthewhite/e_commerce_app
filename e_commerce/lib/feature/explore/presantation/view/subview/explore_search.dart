import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/view/mixin/explore_meal_search_page_mixin.dart';
import 'package:e_commerce/feature/explore/presantation/view/subview/widget/animated_search_item.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ExploreMealSearchPage extends StatefulWidget {
  @override
  _ExploreMealSearchPageState createState() => _ExploreMealSearchPageState();
}

class _ExploreMealSearchPageState extends State<ExploreMealSearchPage>
    with ExploreMealSearchPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGeneralAppBar(title: 'Search', showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: context.paddingAllDefault,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.containerBackground,
                borderRadius: context.borderRadiusCircular6,
              ),
              child: TextField(
                style: context.textTheme.bodySmall?.copyWith(),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (enteredKeyword) {
                  runFilter(enteredKeyword);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: context.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFFA1A1A1),
                  ),
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
                return AnimatedSearchItem(
                  meal: meal,
                  onTap: () {
                    context.read<CartBloc>().add(AddToHiveCartEvent(meal));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
