import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/view/mixin/explore_meal_search_page_mixin.dart';
import 'package:e_commerce/feature/explore/presantation/view/subview/widget/animated_search_item.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ExploreMealSearchPage extends StatefulWidget {
  @override
  _ExploreMealSearchPageState createState() => _ExploreMealSearchPageState();
}

class _ExploreMealSearchPageState extends State<ExploreMealSearchPage>
    with ExploreMealSearchPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop(context);
          },
        ),
        title: Text(
          'Search',
          style: context.textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF000000),
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: context.textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF000000),
                  fontSize: 16,
                ),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (enteredKeyword) {
                  runFilter(enteredKeyword);
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
