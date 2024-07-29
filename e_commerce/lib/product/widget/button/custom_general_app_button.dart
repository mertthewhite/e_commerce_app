import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

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
            child: Center(
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
          ),
        ),
      ),
    );
  }
}
