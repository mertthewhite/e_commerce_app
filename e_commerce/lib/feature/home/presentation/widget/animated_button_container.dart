import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedButtonContainer extends StatefulWidget {
  final String productName;
  final String firstMeasure;
  final String secondMeasure;
  final MealModel model;
  final String ingredient;
  final double price;
  final List<String> image;

  const AnimatedButtonContainer({
    Key? key,
    required this.productName,
    required this.price,
    required this.firstMeasure,
    required this.ingredient,
    required this.secondMeasure,
    required this.model,
    required this.image,
  }) : super(key: key);

  @override
  _AnimatedButtonContainerState createState() =>
      _AnimatedButtonContainerState();
}

class _AnimatedButtonContainerState extends State<AnimatedButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short4,
      curve: Curves.bounceIn,
      width: context.width * NumberConstants.zeroPointFourFive,
      decoration: BoxDecoration(
        borderRadius: context.borderRadiusCircular16,
        border: Border.all(
          color: const Color(0xFFE2E2E2),
        ),
      ),
      child: Padding(
        padding: context.paddingHorizontalDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IngredientThumbnail(
              bigImage: false,
              ingredient: widget.ingredient,
              cart: false,
            ),
            Text(
              widget.productName,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: NumberConstants.eighteen,
              ),
            ),
            MealWidgetInfoRow(widget: widget),
            VerticalSpace.xSmall(),
            PriceWithAddButton(
              price: widget.price,
              model: widget.model,
            ),
          ],
        ),
      ),
    );
  }
}

class PriceWithAddButton extends StatefulWidget {
  final double price;
  final MealModel model;

  const PriceWithAddButton({
    Key? key,
    required this.price,
    required this.model,
  }) : super(key: key);

  @override
  _PriceWithAddButtonState createState() => _PriceWithAddButtonState();
}

class _PriceWithAddButtonState extends State<PriceWithAddButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${widget.price}",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(),
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
          onTap: () async {
            context.read<CartBloc>().add(AddToHiveCartEvent(widget.model));
          },
          child: AnimatedScale(
            scale: _isTapped
                ? NumberConstants.zeroPointSeven
                : NumberConstants.onePointZero,
            duration: Durations.short4,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.lightGreenColor,
                borderRadius: context.borderRadiusCircular14,
              ),
              child: Padding(
                padding:
                    context.paddingAllDefault * NumberConstants.zeroPointNine,
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: NumberConstants.seventeen,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MealWidgetInfoRow extends StatelessWidget {
  const MealWidgetInfoRow({
    super.key,
    required this.widget,
  });

  final AnimatedButtonContainer widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            overflow: TextOverflow.ellipsis,
            widget.firstMeasure,
            style: context.textTheme.labelSmall?.copyWith(
              color: ColorConstants.lightGreyColor,
            ),
          ),
        ),
        Text(
          ",",
          style: context.textTheme.labelSmall?.copyWith(
            color: ColorConstants.lightGreyColor,
          ),
        ),
        Flexible(
          child: Text(
            widget.secondMeasure,
            style: context.textTheme.labelSmall?.copyWith(
              color: ColorConstants.lightGreyColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
