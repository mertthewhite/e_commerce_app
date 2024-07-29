import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.inputType,
    super.key,
    this.hintText,
    this.prefixWidget,
    this.obscureText = false,
    this.suffixWidget,
    this.validator,
    this.labelText,
    this.enabled = true,
    this.onChanged,
    this.maxLength,
    this.filled = false,
    this.focusNode,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixIcon,
    this.textSpan,
    this.maxLines,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType inputType;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool filled;
  final FocusNode? focusNode;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final IconData? prefixIcon;
  final String? textSpan;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: labelText ?? '',
                  style: context.theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.scrim,
                  ),
                ),
                TextSpan(
                  text: '  ',
                ),
                if (textSpan != null)
                  TextSpan(
                      text: textSpan,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.theme.colorScheme.onPrimaryContainer,
                        fontSize: 10,
                      )),
              ],
            ),
          ),
        VerticalSpace.xxSmall(),
        Container(
          height: context.dynamicHeight(0.064),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.theme.colorScheme.surfaceTint),
          child: TextFormField(
            maxLines: maxLines,
            validator: validator,
            focusNode: focusNode,
            onChanged: onChanged,
            maxLength: maxLength,
            enabled: true,
            controller: controller,
            obscureText: obscureText,
            keyboardType: inputType,
            style: context.theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: prefixWidget,
              suffixIcon: suffixWidget,
              alignLabelWithHint: true,
              isDense: true,
              filled: filled,
              fillColor: context.theme.colorScheme.secondary,
              hintText: hintText,
              hintStyle: context.theme.textTheme.labelMedium?.copyWith(
                color: context.theme.colorScheme.surfaceVariant,
              ),
              labelStyle: context.theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.surfaceVariant,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.colorScheme.surface,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: context.theme.colorScheme.error, width: 6),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
