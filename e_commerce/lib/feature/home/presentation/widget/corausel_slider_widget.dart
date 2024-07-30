import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';
import 'package:e_commerce/product/widget/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CorauselSliderWidget extends StatelessWidget {
  CorauselSliderWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final CarouselController controller;

  List<String> items = [
    Assets.images.banner2.path,
    Assets.images.banner3.path,
    Assets.images.banner4.path,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSliderWidget(
      controller: controller,
      items: items.map((item) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              item,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ));
      }).toList(),
      autoPlay: true,
      onPageChanged: (index, reason) {
        context.read<HomeBloc>().add(CardIndexHome(index));
      },
    );
  }
}

Stack carouselWidget(HomeState state) {
  return Stack(children: [
    CorauselSliderWidget(
      controller: CarouselController(),
    ),
    Positioned(
      left: 0,
      right: 0,
      bottom: 5,
      child: CarouselSliderBulletWidget(
        state: state,
      ),
    ),
  ]);
}

class CarouselSliderBulletWidget extends StatelessWidget {
  final HomeState state;
  const CarouselSliderBulletWidget({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < state.meals.length / 9; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: context.read<HomeBloc>().state.cardIndexHome == i ? 19 : 8,
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.read<HomeBloc>().state.cardIndexHome == i
                  ? const Color(0xFF53B175)
                  : ColorConstants.greyColor,
              shape: BoxShape.rectangle,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: context.read<HomeBloc>().state.cardIndexHome == i
                  ? Container(
                      key: ValueKey(1),
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF53B175),
                      ),
                    )
                  : Container(
                      key: ValueKey(2),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.greyColor,
                      ),
                    ),
            ),
          ),
      ],
    );
  }
}
