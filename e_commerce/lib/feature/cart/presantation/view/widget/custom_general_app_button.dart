import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
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
          height: height ?? context.dynamicHeight(0.09),
          width: width ?? context.dynamicWidth(0.89),
          decoration: BoxDecoration(
            color: color ?? const Color(0xff53B175),
            borderRadius: radius ?? BorderRadius.circular(19),
          ),
          child: Padding(
            padding: textPadding ?? context.paddingAllDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: context.dynamicWidth(0.15)),
                Center(
                  child: Text(
                    buttonText,
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: textColor ?? Colors.white,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                      fontSize: textFontsize ?? 16,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF489E67),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      NumberFormat.currency(symbol: "\$", decimalDigits: 2)
                          .format(context.read<CartBloc>().state.totalPrice),
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: textColor ?? Colors.white,
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w700,
                        fontSize: textFontsize ?? 10,
                      ),
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
