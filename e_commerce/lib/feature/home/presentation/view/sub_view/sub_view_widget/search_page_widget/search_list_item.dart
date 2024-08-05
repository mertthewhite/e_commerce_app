part of '../../search_page.dart';

class MealListItem extends StatefulWidget {
  const MealListItem({
    Key? key,
    required this.meal,
    required this.onTap,
    required this.image,
    this.isTapped = false,
  }) : super(key: key);
  final MealModel meal;
  final bool isTapped;
  final void Function(MealModel)? onTap;
  final List<String> image;

  @override
  _MealListItemState createState() => _MealListItemState();
}

class _MealListItemState extends State<MealListItem> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow + context.paddingHorizontalLow,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 30),
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
                      Container(
                        width: context.dynamicWidth(0.4),
                        child: Text(
                          widget.meal.strIngredient2 ?? '',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: const Color(0xFF000000),
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                onTap: () {
                  widget.onTap?.call(widget.meal);
                },
                child: AnimatedScale(
                  scale: _isTapped ? 0.7 : 1.0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.lightGreenColor,
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
    );
  }
}
