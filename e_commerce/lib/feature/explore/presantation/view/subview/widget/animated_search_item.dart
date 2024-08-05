import 'package:e_commerce/product/utility/constants/duration_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:e_commerce/feature/explore/presantation/view/subview/widget/search_info_row.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';

class AnimatedSearchItem extends StatefulWidget {
  const AnimatedSearchItem({
    required this.meal,
    required this.onTap,
    super.key,
  });
  final MealModel meal;
  final VoidCallback onTap;

  @override
  _AnimatedSearchItemState createState() => _AnimatedSearchItemState();
}

class _AnimatedSearchItemState extends State<AnimatedSearchItem> {
  bool _isTapped = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          '/product_detail_page',
          extra: {'selectedProduct': widget.meal},
        );
      },
      child: Padding(
        padding: context.paddingAllLow + context.paddingHorizontalLow,
        child: AnimatedContainer(
          duration: DurationConstants.veryShort(),
          decoration: BoxDecoration(
            color: ColorConstants.lightGreyColor,
            borderRadius: context.borderRadiusCircular10,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: NumberConstants.thirty),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: NumberConstants.eighty,
                      child: IngredientThumbnail(
                        cart: false,
                        ingredient: widget.meal.strIngredient2.toString(),
                        bigImage: false,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.meal.strIngredient2 ?? '',
                          style: context.textTheme.bodySmall?.copyWith(),
                        ),
                        SearchInfoRow(meal: widget.meal),
                      ],
                    ),
                  ],
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
                    duration: const Duration(milliseconds: 100),
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
          ),
        ),
      ),
    );
  }
}
