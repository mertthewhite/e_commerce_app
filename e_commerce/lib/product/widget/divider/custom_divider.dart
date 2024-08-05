import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ColorConstants.lightGreyColorDivider,
    );
  }
}
