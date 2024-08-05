import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/search_page');
      },
      child: Container(
        height: context.dynamicHeight(0.08),
        width: context.dynamicWidth(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.containerBackground,
        ),
        child: Row(
          children: [
            const HorizontalSpace.small(),
            SvgPicture.asset(
              'assets/icons/search.svg',
              width: 17.21,
            ),
            const HorizontalSpace.small(),
            Text(
              "Search Store",
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstants.lightGreyColor,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
