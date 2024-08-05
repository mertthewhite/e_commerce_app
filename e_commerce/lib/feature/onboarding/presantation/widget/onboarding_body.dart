import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/button/custom_general_app_button.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: ColorConstants.lightGreenColor,
        image: DecorationImage(
          image: AssetImage('assets/images/onbaordingg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            'assets/icons/carrot.svg',
            color: Colors.white,
            width: NumberConstants.fourty,
          ),
          const OnboardingPageText(),
          CustomGeneralAppButton(
              buttonText: 'Get Started',
              onTap: () {
                context.push('/home_page');
              }),
          const VerticalSpace.large(),
        ],
      ),
    );
  }
}

class OnboardingPageText extends StatelessWidget {
  const OnboardingPageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace.small(),
        Text('Welcome \nto our store',
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium?.copyWith(
              color: Colors.white,
            )),
        const VerticalSpace.xxSmall(),
        Text(
          'Ger your groceries in as fast as one hour',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: const Color(0xffFCFCFC),
          ),
        ),
        const VerticalSpace.medium(),
      ],
    );
  }
}
