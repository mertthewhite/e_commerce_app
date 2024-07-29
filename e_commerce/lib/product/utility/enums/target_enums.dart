import 'package:flutter/material.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';

enum TargetIcon {
  gift('assets/icons/gift_tar_ic.svg', 'Hediyeler'),
  driving('assets/icons/driving_tar_ic.svg', 'Ulaşım'),
  shopping('assets/icons/shopping_tar_ic.svg', 'Market'),
  people('assets/icons/people_tar_ic.svg', 'Aile'),
  health('assets/icons/health_tar_icc.svg', 'Sağlık'),
  coffee('assets/icons/coffee_tar_ic.svg', 'Kafe'),
  education('assets/icons/education_tar_ic.svg', 'Eğitim'),
  plus('assets/icons/plus_ic.svg', 'Oluştur');

  final String iconPath;
  final String label;

  const TargetIcon(this.iconPath, this.label);
}

enum TargetColor {
  blue(ColorConstants.blueColor),
  cyan(ColorConstants.cyanColor),
  purple(ColorConstants.purpleColor),
  grey(ColorConstants.greyyColor),
  red(ColorConstants.redColor),
  navyBlue(ColorConstants.navyBlueColor),
  cyanGreen(ColorConstants.cyanGreenColor),
  orange(ColorConstants.orangeeColor),
  deepPurple(ColorConstants.deepPurpleColor),
  pink(ColorConstants.pinkColor),
  turkuaz(ColorConstants.turkuazColor),
  black(ColorConstants.blackColor);

  final Color color;

  const TargetColor(this.color);
}
