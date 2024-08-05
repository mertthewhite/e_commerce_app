import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:flutter/material.dart';

class CartCheckOutList extends StatelessWidget {
  final String firstText;
  final String? secondText;
  final Widget? widget;
  final void Function()? onTap;
  final Widget? widget2;

  const CartCheckOutList({
    super.key,
    required this.firstText,
    this.secondText,
    this.widget2,
    this.onTap,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: context.paddingHorizontalDefault,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: context.borderRadiusCircular16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    firstText,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: ColorConstants.lightGreyColor,
                    ),
                  ),
                  Row(
                    children: [
                      widget2 ??
                          Text(
                            secondText ?? '',
                            style: context.textTheme.labelMedium?.copyWith(),
                          ),
                      widget ??
                          const Icon(
                            Icons.keyboard_arrow_right,
                            size: NumberConstants.twentyfive,
                          ),
                    ],
                  ),
                ],
              ),
            ),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
