import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/mixin/cart_mixin.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_page_button.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_page_card.dart';
import 'package:e_commerce/product/widget/empty_widget/emty_widget.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with CartPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGeneralAppBar(
        title: 'Cart',
        showBackButton: false,
        divider: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final addedMeals = state.addedMeals;
          final totalPrice = getTotalPrice(addedMeals);
          context.read<CartBloc>().add(AddedMeals());
          context.read<CartBloc>().add(TotalPriceUpdatedState(totalPrice));
          final sortedMeals = addedMeals.entries.toList()
            ..sort((a, b) {
              final aId = a.key.idMeal ?? '';
              final bId = b.key.idMeal ?? '';
              return bId.compareTo(aId);
            });
          if (addedMeals.isEmpty) {
            return const CustomEmtyWidget(
              isCart: true,
              isFavourite: false,
            );
          }
          return Stack(
            children: [
              ListView.builder(
                itemCount: sortedMeals.length,
                itemBuilder: (BuildContext context, int index) {
                  final meal = sortedMeals[index].key;
                  return CartPageCard(
                    meal: meal,
                    count: sortedMeals[index].value,
                  );
                },
              ),
              const CartPageButton(),
            ],
          );
        },
      ),
    );
  }
}
