part of '../../product_detail_page.dart';

class ProductDetail extends StatefulWidget {
  final MealModel selectedProduct;

  const ProductDetail({Key? key, required this.selectedProduct})
      : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Product Detail",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFF181725),
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.keyboard_arrow_right_rounded,
              ),
            )
          ],
        ),
        if (isExpanded)
          Column(
            children: [
              const SizedBox(height: 8.0), // Replace VerticalSpace.small()
              Text(
                widget.selectedProduct.strInstructions.toString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorConstants.lightGreyColor,
                    ),
              ),
            ],
          ),
      ],
    );
  }
}
