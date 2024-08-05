part of '../../all_product_page.dart';

class AllProductInfoRow extends StatelessWidget {
  const AllProductInfoRow({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            overflow: TextOverflow.ellipsis,
            meal.strMeasure6 ?? '',
            style: context.textTheme.labelSmall?.copyWith(
              color: ColorConstants.lightGreyColor,
            ),
          ),
        ),
        Text(
          ",",
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.labelSmall?.copyWith(
            color: ColorConstants.lightGreyColor,
          ),
        ),
        Flexible(
          child: Text(
            meal.strMeasure2 ?? '',
            style: context.textTheme.labelSmall?.copyWith(
              overflow: TextOverflow.ellipsis,
              color: ColorConstants.lightGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
