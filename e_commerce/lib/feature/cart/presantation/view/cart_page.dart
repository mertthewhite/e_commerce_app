import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/mixin/cart_mixin.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_body.dart';
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
          final addedMeals = getAddedMeals();
          final totalPrice = getTotalPrice(addedMeals);
          context.read<CartBloc>().add(TotalPriceUpdatedState(totalPrice));
          if (addedMeals.isEmpty) {
            return const CustomEmtyWidget(
              isCart: true,
              isFavourite: false,
            );
          }
          return CartBody(
            addedMeals: addedMeals,
          );
        },
      ),
    );
  }
}
