import 'package:e_commerce/product/extensions/context_extensions.dart';
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
      height: context.dynamicHeight(0.075),
      width: context.dynamicWidth(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF2F3F2),
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
              color: const Color(0xFF7C7C7C),
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
