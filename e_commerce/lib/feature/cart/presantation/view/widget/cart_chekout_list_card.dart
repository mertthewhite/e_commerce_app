import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_check_out_list.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
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
          ),
        ),
        CartCheckOutList(
          firstText: "Payment",
          widget2: SvgPicture.asset(
            'assets/icons/checkout.svg',
            width: NumberConstants.twenty,
          ),
          widget: const Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
        const CartCheckOutList(
          firstText: "Promo Code",
          secondText: "Pick Discount",
          widget: Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
        CartCheckOutList(
          firstText: "Total",
          secondText: NumberFormat.currency(
                  symbol: "\$", decimalDigits: NumberConstants.twoInt)
              .format(context.read<CartBloc>().state.totalPrice),
        ),
      ],
    );
  }
}
