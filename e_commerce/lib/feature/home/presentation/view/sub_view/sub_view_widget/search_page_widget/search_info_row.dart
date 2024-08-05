part of '../../search_page.dart';

class SearchInfoRow extends StatelessWidget {
  const SearchInfoRow({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.5),
      child: Row(
        children: [
          Text(
            meal.strMeasure6 ?? '',
            style: const TextStyle(
              color: ColorConstants.lightGreyColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const Text(
            ",",
            style: TextStyle(
              color: ColorConstants.lightGreyColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              meal.strMeasure2 ?? '',
              style: context.textTheme.headlineLarge?.copyWith(
                overflow: TextOverflow.ellipsis,
                color: ColorConstants.lightGreyColor,
                fontFamily: "Gilroy-Medium",
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
