import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/view/cart_page.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_check_out_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartChekoutListCard extends StatelessWidget {
  const CartChekoutListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CartCheckOutList(
          firstText: "Delivery",
          secondText: "Select Method",
          widget: Icon(
            Icons.keyboard_arrow_right,
            size: 24,
            color: Color(0xFF181725),
          ),
        ),
        CartCheckOutList(
          firstText: "Payment",
          widget2: SvgPicture.asset(
            'assets/icons/checkout.svg',
            width: 20,
          ),
          widget: const Icon(
            Icons.keyboard_arrow_right,
            size: 24,
            color: Color(0xFF181725),
          ),
        ),
        const CartCheckOutList(
          firstText: "Promo Code",
          secondText: "Pick Discount",
          widget: Icon(
            Icons.keyboard_arrow_right,
            size: 24,
            color: Color(0xFF181725),
          ),
        ),
        CartCheckOutList(
          firstText: "Total",
          secondText: NumberFormat.currency(symbol: "\$", decimalDigits: 2)
              .format(context.read<CartBloc>().state.totalPrice),
        ),
      ],
    );
  }
}
