import 'package:e_commerce/feature/cart/presantation/view/widget/cart_bottom_sheet.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/custom_general_app_button.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:flutter/material.dart';

class CartPageButton extends StatelessWidget {
  const CartPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:
          MediaQuery.of(context).size.height * NumberConstants.zeroPointZeroTwo,
      left:
          MediaQuery.of(context).size.width * NumberConstants.zeroPointZeroFive,
      right:
          MediaQuery.of(context).size.width * NumberConstants.zeroPointZeroFive,
      child: CustomGeneralAppButton(
        buttonText: "Go To Checkout",
        onTap: () {
          showModalBottomSheet<CartBottomSheet>(
            scrollControlDisabledMaxHeightRatio: NumberConstants.zeroPointSeven,
            context: context,
            builder: (context) => CartBottomSheet(),
          );
        },
      ),
    );
  }
}
