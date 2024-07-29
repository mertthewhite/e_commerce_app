import 'package:e_commerce/feature/cart/presantation/view/widget/cart_bottom_sheet.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/custom_general_app_button.dart';
import 'package:flutter/material.dart';

class CartPageButton extends StatelessWidget {
  const CartPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.02,
      left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: CustomGeneralAppButton(
        buttonText: "Go To Checkout",
        onTap: () {
          showModalBottomSheet(
            scrollControlDisabledMaxHeightRatio: 0.7,
            context: context,
            builder: (context) => CartBottomSheet(),
          );
        },
      ),
    );
  }
}
