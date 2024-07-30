import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedButtonContainer extends StatefulWidget {
  final String productName;
  final String firstMeasure;
  final String secondMeasure;
  final MealModel model;
  final String ingredient;
  final double price;

  const AnimatedButtonContainer({
    Key? key,
    required this.productName,
    required this.price,
    required this.firstMeasure,
    required this.ingredient,
    required this.secondMeasure,
    required this.model,
  }) : super(key: key);

  @override
  _AnimatedButtonContainerState createState() =>
      _AnimatedButtonContainerState();
}

class _AnimatedButtonContainerState extends State<AnimatedButtonContainer> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE2E2E2),
        ),
      ),
      child: Padding(
        padding: context.paddingHorizontalDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IngredientThumbnail(
                bigImage: false, ingredient: widget.ingredient, cart: false),
            Text(
              widget.productName ?? '',
              style: const TextStyle(
                color: Color(0xFF181725),
                fontFamily: "Gilroy-Bold",
                fontWeight: FontWeight.w700,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    widget.firstMeasure ?? '',
                    style: const TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontFamily: "Gilroy-Medium",
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Text(
                  ",",
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontFamily: "Gilroy-Medium",
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                Flexible(
                  child: Text(
                    widget.secondMeasure ?? '',
                    style: context.textTheme.headlineLarge?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: const Color(0xFF7C7C7C),
                      fontFamily: "Gilroy-Medium",
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpace.xSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.price}",
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFF181725),
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _isTapped = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      _isTapped = false;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      _isTapped = false;
                    });
                  },
                  onTap: () async {
                    context
                        .read<CartBloc>()
                        .add(AddToHiveCartEvent(widget.model));
                  },
                  child: AnimatedScale(
                    scale: _isTapped ? 0.7 : 1.0,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF53B175),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: context.paddingAllDefault * 0.8,
                        child: SvgPicture.asset(
                          'assets/icons/plus.svg',
                          width: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
