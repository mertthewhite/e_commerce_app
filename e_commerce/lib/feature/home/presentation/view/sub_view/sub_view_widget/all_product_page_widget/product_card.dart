part of '../../all_product_page.dart';

class ProductCard extends StatefulWidget {
  final List<String> image;
  final MealModel meal;

  const ProductCard({
    Key? key,
    required this.image,
    required this.meal,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          '/product_detail_page',
          extra: {'selectedProduct': meal},
        );
      },
      child: AnimatedContainer(
        duration: DurationConstants.veryShort(),
        width: context.width * NumberConstants.zeroPointFourFive,
        decoration: BoxDecoration(
          borderRadius: context.borderRadiusCircular14,
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
                ingredient: meal.strIngredient2.toString(),
                bigImage: false,
              ),
              Text(
                meal.strIngredient2 ?? '',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF000000),
                ),
              ),
              AllProductInfoRow(meal: meal),
              const VerticalSpace.xSmall(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${meal.price}',
                    style: context.textTheme.bodySmall,
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
                    onTap: () {
                      context.read<CartBloc>().add(AddToHiveCartEvent(meal));
                    },
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
                            width: IconSize.xmedium.value,
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
