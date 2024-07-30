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

  List items = [
    Assets.images.banner2.path,
    Assets.images.banner3.path,
    Assets.images.banner4.path,
    Assets.images.banner2.path,
    Assets.images.banner3.path,
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
      bottom: 0,
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
        for (int i = 0; i < state.meals.length / 5; i++)
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: context.read<HomeBloc>().state.cardIndexHome == i
                  ? const Color(0xFF53B175)
                  : ColorConstants.greyColor,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
