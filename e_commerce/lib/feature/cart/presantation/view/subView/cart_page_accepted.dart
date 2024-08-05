import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/button/custom_general_app_button.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CartPageAccepted extends StatefulWidget {
  const CartPageAccepted({super.key});

  @override
  State<CartPageAccepted> createState() => _CartPageAcceptedState();
}

class _CartPageAcceptedState extends State<CartPageAccepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: context.dynamicWidth(
                  NumberConstants.zeroPointZeroSix,
                ),
              ),
              child: SvgPicture.asset(
                "assets/images/cart_background.svg",
                width: context.dynamicWidth(
                  NumberConstants.zeroPointEight,
                ),
              ),
            ),
            const VerticalSpace.medium(),
            Text(
              textAlign: TextAlign.center,
              "Your order has been \n accepted",
              style: context.textTheme.headlineMedium,
            ),
            const VerticalSpace.small(),
            Text(
              textAlign: TextAlign.center,
              "Your items has been placcd and is \non it’s way to being processed",
              style: context.textTheme.labelMedium?.copyWith(
                color: ColorConstants.lightGreyColor,
              ),
            ),
            const VerticalSpace.large(),
            CustomGeneralAppButton(buttonText: "Track Order", onTap: () {}),
            const VerticalSpace.small(),
            CustomGeneralAppButton(
              buttonText: "Back to Home",
              onTap: () {
                context.go('/home_page');
              },
              textColor: ColorConstants.blackColor,
              color: ColorConstants.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
