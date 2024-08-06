import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';
import 'package:e_commerce/product/widget/button/custom_general_app_button.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
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
              child: Assets.images.cartBackground.svg(),
            ),
            const AcceptedPageText(),
            const AcceptedPageButton(),
          ],
        ),
      ),
    );
  }
}

class AcceptedPageButton extends StatelessWidget {
  const AcceptedPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace.large(),
        CustomGeneralAppButton(
          buttonText: "Track Order",
          onTap: () {},
        ),
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
    );
  }
}

class AcceptedPageText extends StatelessWidget {
  const AcceptedPageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
