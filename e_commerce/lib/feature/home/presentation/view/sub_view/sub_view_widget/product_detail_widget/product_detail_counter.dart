part of '../../product_detail_page.dart';

class ProductDetailCounter extends StatelessWidget {
  final MealModel meal;
  const ProductDetailCounter({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                if (context.read<HomeBloc>().state.index <= 0) {
                  null;
                } else
                  context.read<HomeBloc>().add(UpdateMinusIndex());
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.lightGreyColorDivider,
                  ),
                  borderRadius: context.borderRadiusCircular14,
                ),
                child: Padding(
                  padding: context.paddingAllLow,
                  child: Icon(
                    Icons.remove,
                    color: ColorConstants.greyColor,
                  ),
                ),
              ),
            ),
            const HorizontalSpace.xSmall(),
            Container(
              decoration: const BoxDecoration(),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final itemCount = context.watch<HomeBloc>().state.index;
                  return Text(
                    itemCount.toString(),
                    style: context.textTheme.bodyMedium?.copyWith(),
                  );
                },
              ),
            ),
            const HorizontalSpace.xSmall(),
            InkWell(
              onTap: () {
                context.read<HomeBloc>().add(UpdatePlusIndex());
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.lightGreyColorDivider,
                  ),
                  borderRadius: context.borderRadiusCircular14,
                ),
                child: Padding(
                  padding: context.paddingAllLow,
                  child: const Icon(
                    Icons.add,
                    color: ColorConstants.lightGreenColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          "\$${meal.price}",
          style: context.textTheme.bodyLarge,
        )
      ],
    );
  }
}
