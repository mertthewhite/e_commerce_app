import 'package:e_commerce/feature/favourite/presantation/widget/favourite_card_widget.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouritePageBody extends StatelessWidget {
  const FavouritePageBody({
    super.key,
    required this.context,
    required this.favouriteMeal,
  });

  final BuildContext context;
  final List<MealModel> favouriteMeal;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(
        color: Color(0xffE2E2E2),
        thickness: 1,
      ),
      SizedBox(
        height: context.dynamicHeight(1.5),
        child: ListView.builder(
          itemCount: favouriteMeal.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  GoRouter.of(context).push(
                    '/product_detail_page',
                    extra: {'selectedProduct': favouriteMeal[index]},
                  );
                },
                child: FavouriteCard(
                  favouriteMeal: favouriteMeal,
                  index: index,
                ));
          },
        ),
      ),
    ]);
  }
}
