import 'package:e_commerce/product/extensions/context_extensions.dart';
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
            style: context.textTheme.labelMedium?.copyWith(
              color: const Color(0xFF181725),
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              fontSize: 24,
            )),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/all_product_page');
          },
          child: Text(
            "See all",
            style: context.textTheme.labelMedium?.copyWith(
              color: const Color(0xFF53B175),
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
