import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExplorePageSearchBar extends StatelessWidget {
  const ExplorePageSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(NumberConstants.zeroPointZeroSeven),
      width: context.dynamicWidth(NumberConstants.one),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NumberConstants.fifteen),
        color: ColorConstants.containerBackground,
      ),
      child: Row(
        children: [
          const HorizontalSpace.small(),
          SvgPicture.asset(
            'assets/icons/search.svg',
            width: NumberConstants.eighteen,
          ),
          const HorizontalSpace.small(),
          Text(
            'Search Store',
            style: context.textTheme.bodySmall?.copyWith(
              color: ColorConstants.lightGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
