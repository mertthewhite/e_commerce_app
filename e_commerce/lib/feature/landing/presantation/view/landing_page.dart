import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/landing/presantation/mixin/landing_mixin.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with LandingPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.meals.isNotEmpty && !navigatedNotifier.value) {
          navigatedNotifier.value = true;
          context.push('/onboarding_page');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ColorConstants.lightGreenColor,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/landing.svg',
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: navigatedNotifier,
              builder: (context, navigated, child) {
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
