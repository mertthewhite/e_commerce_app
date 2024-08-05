import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEmtyWidget extends StatelessWidget {
  const CustomEmtyWidget({
    super.key,
    required this.isCart,
    required this.isFavourite,
  });
  final bool isCart;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            isFavourite
                ? 'assets/lottie/unfound_general.json'
                : 'assets/lottie/unfound.json',
            width: context.width * NumberConstants.zeroPointEight,
          ),
          isFavourite
              ? VerticalSpace.xLarge()
              : const SizedBox(
                  height: 0,
                ),
          Text(
            isFavourite
                ? "Please add your favourite meal"
                : "Your cart is empty",
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
