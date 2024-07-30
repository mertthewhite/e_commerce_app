import 'package:e_commerce/feature/explore/presantation/view/subview/explore_category_detail_page.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AnimatedProductItem extends StatefulWidget {
  final MealModel meal;
  final bool isTapped;
  final VoidCallback onTap;

  const AnimatedProductItem({
    Key? key,
    required this.meal,
    required this.onTap,
    required this.isTapped,
  }) : super(key: key);

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
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFE2E2E2),
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
                  bigImage: false),
              Text(
                widget.meal.strIngredient2 ?? '',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF000000),
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.meal.strMeasure6 ?? '',
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
                      overflow: TextOverflow.ellipsis,
                      widget.meal.strMeasure2 ?? '',
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
      ),
    );
  }
}
