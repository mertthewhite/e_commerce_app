import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CartCheckoutInfo extends StatelessWidget {
  const CartCheckoutInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow + context.paddingHorizontalDefault,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'By placing an order you agree to our',
            style: context.textTheme.labelSmall?.copyWith(
              color: ColorConstants.lightGreyColor,
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms ',
                  style: context.textTheme.labelSmall,
                ),
                TextSpan(
                  text: 'and ',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: ColorConstants.lightGreyColor,
                  ),
                ),
                TextSpan(
                  text: 'Conditions',
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
