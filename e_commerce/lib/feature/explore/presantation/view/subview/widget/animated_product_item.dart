import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/duration_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AnimatedProductItem extends StatefulWidget {
  const AnimatedProductItem({
    required this.meal,
    required this.onTap,
    required this.isTapped,
    super.key,
  });
  final MealModel meal;
  final bool isTapped;
  final VoidCallback onTap;

  @override
  _AnimatedProductItemState createState() => _AnimatedProductItemState();
}

class _AnimatedProductItemState extends State<AnimatedProductItem> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          '/product_detail_page',
          extra: {'selectedProduct': widget.meal},
        );
      },
      child: AnimatedContainer(
        duration: DurationConstants.veryShort(),
        width: MediaQuery.of(context).size.width *
            NumberConstants.zeroPointFourFive,
        decoration: BoxDecoration(
          borderRadius: context.borderRadiusCircular16,
          border: Border.all(
            color: ColorConstants.borderGreyColor,
          ),
        ),
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IngredientThumbnail(
                cart: false,
                ingredient: widget.meal.strIngredient2.toString(),
                bigImage: false,
              ),
              Text(
                widget.meal.strIngredient2 ?? '',
                style: context.textTheme.bodySmall?.copyWith(),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.meal.strMeasure6 ?? '',
                      style: context.textTheme.bodySmall?.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: ColorConstants.lightGreyColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    ",",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: ColorConstants.lightGreyColor,
                      fontSize: 12,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.meal.strMeasure2 ?? '',
                      style: context.textTheme.bodySmall?.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: ColorConstants.lightGreyColor,
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
                    "\$${widget.meal.price}",
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
                    onTap: widget.onTap,
                    child: AnimatedScale(
                      scale: _isTapped
                          ? NumberConstants.zeroPointSeven
                          : NumberConstants.one,
                      duration: DurationConstants.veryShort(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.lightGreenColor,
                          borderRadius: context.borderRadiusCircular14,
                        ),
                        child: Padding(
                          padding: context.paddingAllDefault *
                              NumberConstants.zeroPointEight,
                          child: SvgPicture.asset(
                            'assets/icons/plus.svg',
                            width: NumberConstants.seventeen,
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
      ),
    );
  }
}
