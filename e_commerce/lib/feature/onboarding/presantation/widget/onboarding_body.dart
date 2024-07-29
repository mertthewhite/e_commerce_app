import 'package:e_commerce/feature/onboarding/presantation/view/onboarding_page.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
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
      decoration: BoxDecoration(
        color: Color(0xFF53B175),
        image: DecorationImage(
          image: AssetImage('assets/images/onbaordingg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset('assets/icons/carrot.svg',
              color: Colors.white, width: 40),
          VerticalSpace.small(),
          Text("Welcome \nto our store",
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 40,
              )),
          VerticalSpace.xxSmall(),
          Text(
            "Ger your groceries in as fast as one hour",
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(
              color: Color(0xffFCFCFC),
              fontFamily: "Gilroy-Medium",
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          VerticalSpace.medium(),
          CustomGeneralAppButton(
              buttonText: "Get Started",
              onTap: () {
                isUserLogin
                    ? context.push('/home_page')
                    : context.push('/login_page');
              }),
          VerticalSpace.large(),
        ],
      ),
    );
  }
}
