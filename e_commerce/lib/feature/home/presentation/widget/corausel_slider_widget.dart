import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CorauselSliderWidget extends StatelessWidget {
  List<String> items;
  CarouselController controller;

  CorauselSliderWidget({
    required this.controller,
    required this.items,
    Key? key,
  }) : super(key: key);

//dışarı al

  @override
  Widget build(BuildContext context) {
    return CarouselSliderWidget(
      controller: controller,
      items: items.map((item) {
        return ClipRRect(
            borderRadius: context.borderRadiusCircular14,
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
        for (int i = NumberConstants.zeroInt;
            i < state.meals.length / NumberConstants.nineInt;
            i++)
          AnimatedContainer(
            duration: Durations.long1,
            width: context.read<HomeBloc>().state.cardIndexHome == i
                ? NumberConstants.nineteen
                : NumberConstants.eight,
            height: NumberConstants.five,
            margin:
                context.paddingHorizontalLow * NumberConstants.zeroPointFive,
            decoration: BoxDecoration(
              borderRadius: context.borderRadiusCircular8,
              color: context.read<HomeBloc>().state.cardIndexHome == i
                  ? ColorConstants.lightGreenColor
                  : ColorConstants.greyColor,
              shape: BoxShape.rectangle,
            ),
            child: AnimatedSwitcher(
              duration: Durations.short1,
              child: context.read<HomeBloc>().state.cardIndexHome == i
                  ? Container(
                      key: ValueKey(1),
                      height: NumberConstants.eight,
                      decoration: BoxDecoration(
                        borderRadius: context.borderRadiusCircular8,
                        color: ColorConstants.lightGreenColor,
                      ),
                    )
                  : Container(
                      key: ValueKey(2),
                      width: NumberConstants.eight,
                      height: NumberConstants.eight,
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
