import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/mixin/cart_mixin.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_body.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/custom_app_bar.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/emty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with CartPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Cart",
          onTitleTap: () {
            context.pop();
          },
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            final addedMeals = getAddedMeals();
            final totalPrice = getTotalPrice(addedMeals);
            context.read<CartBloc>().add(TotalPriceUpdatedState(totalPrice));
            if (addedMeals.isEmpty) {
              return const EmtyWidget();
            }
            return CartBody(addedMeals: addedMeals);
          },
        ),
      ),
    );
  }
}
