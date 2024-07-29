import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/button/app_bar_button_widget.dart';
import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    required String title,
    required void Function() onPressedLeading,
    super.key,
  }) : super(
          title: Text(title),
          leading: AppBarButtonWidget(
            onPressed: onPressedLeading,
            icon: Icons.arrow_back,
            color: ColorConstants.deepBlueColor,
          ),
        );
}
