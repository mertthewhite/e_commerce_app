import 'package:e_commerce/product/extensions/context_extensions.dart';
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
                right: context.dynamicWidth(0.06),
              ),
              child: SvgPicture.asset("assets/images/cart_background.svg",
                  width: 250),
            ),
            VerticalSpace.medium(),
            Text(
              textAlign: TextAlign.center,
              "Your order has been \n accepted",
              style: context.textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF000000),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            VerticalSpace.small(),
            Text(
              textAlign: TextAlign.center,
              "Your items has been placcd and is \non it’s way to being processed",
              style: context.textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF7C7C7C),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            VerticalSpace.large(),
            CustomGeneralAppButton(buttonText: "Track Order", onTap: () {}),
            VerticalSpace.small(),
            CustomGeneralAppButton(
              buttonText: "Back to Home",
              onTap: () {
                context.go('/home_page');
              },
              textColor: const Color(0xFF000000),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
