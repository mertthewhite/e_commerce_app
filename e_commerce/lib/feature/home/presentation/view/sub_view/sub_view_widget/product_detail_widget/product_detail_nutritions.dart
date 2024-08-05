part of '../../product_detail_page.dart';

class ProductDetailNutritions extends StatefulWidget {
  final MealModel selectedProduct;

  const ProductDetailNutritions({Key? key, required this.selectedProduct})
      : super(key: key);

  @override
  _ProductDetailNutritionsState createState() =>
      _ProductDetailNutritionsState();
}

class _ProductDetailNutritionsState extends State<ProductDetailNutritions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Nutritions",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFF181725),
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.containerBackground,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: context.paddingAllLow * 0.7,
                    child: Text(
                      widget.selectedProduct.strMeasure1 ?? '',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: ColorConstants.lightGreyColor,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w700,
                                fontSize: 9,
                              ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      // Your state change logic here, if any
                    });
                  },
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            )
          ],
        ),
        const CustomDivider(),
      ],
    );
  }
}
