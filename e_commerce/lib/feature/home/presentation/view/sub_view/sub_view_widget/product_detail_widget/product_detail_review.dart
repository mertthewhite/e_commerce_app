part of '../../product_detail_page.dart';

class ProductDetailReview extends StatelessWidget {
  final MealModel selectedProduct;

  const ProductDetailReview({Key? key, required this.selectedProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Review",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFF181725),
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
            ),
            Row(
              children: [
                rate.RatingStars(
                  value: context.watch<HomeBloc>().state.ratingStars,
                  onValueChanged: (v) {
                    context
                        .read<HomeBloc>()
                        .add(RatingStars(v, selectedProduct));
                  },
                  starBuilder: (index, color) => Icon(
                    Icons.star,
                    color: color,
                  ),
                  valueLabelVisibility: false,
                  animationDuration: const Duration(milliseconds: 1000),
                  starColor: const Color(0xffF3603F),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
