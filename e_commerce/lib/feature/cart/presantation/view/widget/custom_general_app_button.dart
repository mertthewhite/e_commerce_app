import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGeneralAppButton extends StatelessWidget {
  final String buttonText;
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius? radius;
  final EdgeInsets? textPadding;
  final Color? textColor;
  final double? textFontsize;
  final void Function()? onTap;

  const CustomGeneralAppButton({
    super.key,
    required this.buttonText,
    this.height,
    this.width,
    this.color,
    this.radius,
    this.textPadding,
    this.textColor,
    this.textFontsize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height ??
              context.dynamicHeight(NumberConstants.zeroPointZeroNine),
          width: width ?? context.dynamicWidth(NumberConstants.zeroPointNine),
          decoration: BoxDecoration(
              color: color ?? ColorConstants.lightGreenColor,
              borderRadius: radius ?? context.borderRadiusCircular18),
          child: Padding(
            padding: textPadding ?? context.paddingAllDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width:
                        context.dynamicWidth(NumberConstants.zeroPointOneFive)),
                Center(
                  child: Text(
                    buttonText,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: textColor ?? ColorConstants.whiteColor,
                      fontSize: textFontsize ?? NumberConstants.sixteen,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.lightGreyColor,
                      borderRadius: context.borderRadiusCircular6),
                  child: Padding(
                    padding: context.paddingAllLow,
                    child: Text(
                      NumberFormat.currency(
                              symbol: "\$",
                              decimalDigits: NumberConstants.twoInt)
                          .format(context.read<CartBloc>().state.totalPrice),
                      style: context.textTheme.headlineLarge?.copyWith(
                          color: textColor ?? Colors.white,
                          fontSize: textFontsize ?? NumberConstants.ten),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
