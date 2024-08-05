part of '../../product_detail_page.dart';

class ProductDetailFavRow extends StatelessWidget {
  final MealModel selectedProduct;

  const ProductDetailFavRow({Key? key, required this.selectedProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedProduct.strIngredient2.toString(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
            ),
            LikeButton(
              animationDuration: DurationConstants.veryShort(),
              onTap: (bool isLiked) {
                final favBloc = context.read<FavouriteBloc>();
                final isFavourite =
                    favBloc.state.favourites.contains(selectedProduct);

                if (isFavourite) {
                  favBloc.add(RemoveFromFavouriteEvent(selectedProduct));
                } else {
                  favBloc.add(AddToFavouriteEvent(selectedProduct));
                }

                return Future.value(!isLiked);
              },
              likeBuilder: (bool isLiked) {
                return Icon(Icons.favorite,
                    color: context
                            .watch<FavouriteBloc>()
                            .state
                            .favourites
                            .contains(selectedProduct)
                        ? ColorConstants.redColor
                        : ColorConstants.lightGreyColor,
                    size: IconSize.medium.value);
              },
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                selectedProduct.strMeasure6 ?? '',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ColorConstants.lightGreyColor,
                    ),
              ),
            ),
            Text(
              ",",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ColorConstants.lightGreyColor,
                  ),
            ),
            Flexible(
              child: Text(
                selectedProduct.strMeasure2 ?? '',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: ColorConstants.lightGreyColor,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
