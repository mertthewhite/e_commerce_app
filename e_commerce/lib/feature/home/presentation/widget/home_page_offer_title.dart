import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageOfferTitle extends StatelessWidget {
  const HomePageOfferTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Exclusive Offer",
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
            )),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/all_product_page');
          },
          child: Text(
            "See all",
            style: context.textTheme.bodySmall?.copyWith(
              color: ColorConstants.lightGreenColor,
            ),
          ),
        )
      ],
    );
  }
}
