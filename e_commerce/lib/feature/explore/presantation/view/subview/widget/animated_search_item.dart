import 'package:e_commerce/feature/explore/presantation/view/subview/explore_search.dart';
import 'package:e_commerce/feature/explore/presantation/view/subview/widget/search_info_row.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AnimatedSearchItem extends StatefulWidget {
  final MealModel meal;
  final VoidCallback onTap;

  const AnimatedSearchItem({
    Key? key,
    required this.meal,
    required this.onTap,
  }) : super(key: key);

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
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 90,
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
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: const Color(0xFF000000),
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
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
          ),
        ),
      ),
    );
  }
}
