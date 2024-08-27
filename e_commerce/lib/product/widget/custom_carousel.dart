import 'package:carousel_slider/carousel_controller.dart' as CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    required this.items,
    required this.autoPlay,
    required this.controller,
    super.key,
    this.onPageChanged,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
  });
  final List<Widget> items;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final CarouselController.CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      items: items,
      options: CarouselOptions(
        padEnds: false,
        autoPlayAnimationDuration: autoPlayAnimationDuration,
        autoPlayInterval: autoPlayInterval,
        viewportFraction: 1,
        autoPlay: autoPlay,
        onPageChanged: onPageChanged,
        aspectRatio: 2.78,
      ),
    );
  }
}
