import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        if (mediaQuery.size.height < 700)
          const SizedBox()
        else
          const VerticalSpace.medium(),
        SvgPicture.asset(
          'assets/icons/carrot.svg',
          width: 20,
        ),
        const VerticalSpace.xxSmall(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/pin.svg',
              width: 13,
            ),
            const HorizontalSpace.xxSmall(),
            Text(
              "Dhaka, Banassre",
              style: context.textTheme.headlineLarge?.copyWith(
                color: const Color(0xFF4C4F4D),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
