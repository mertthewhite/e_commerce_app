import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/product_detail_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';
import 'package:e_commerce/product/widget/button/custom_general_app_button.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart' as rate;
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.selectedProduct});
  final MealModel selectedProduct;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

bool _isExpanded = false;

class _ProductDetailPageState extends State<ProductDetailPage>
    with ProductDetailMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        setState(() {
          widget.selectedProduct.rating = state.meals
              .firstWhere(
                  (element) => element.idMeal == widget.selectedProduct.idMeal)
              .rating;
        });
      },
      child: Scaffold(
          backgroundColor: ColorConstants.containerBackground,
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorConstants.containerBackground,
              ),
              child: Column(
                children: [
                  if (context.height > 800)
                    const VerticalSpace.medium()
                  else
                    const VerticalSpace.xSmall(),
                  const VerticalSpace.small(),
                  Padding(
                    padding: context.paddingAllDefault,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: NumberConstants.twentyfive,
                          ),
                        ),
                        Assets.icons.export.svg(
                          width: NumberConstants.twentyfive,
                          height: NumberConstants.twentyfive,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: context.dynamicHeight(0.4),
                    decoration: const BoxDecoration(
                      color: ColorConstants.containerBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: double.infinity,
                    child: IngredientThumbnail(
                      cart: false,
                      bigImage: true,
                      ingredient:
                          widget.selectedProduct.strIngredient2.toString(),
                    ),
                  ),
                  Padding(
                    padding: context.paddingAllDefault * 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDetailFavRow(context),
                        const VerticalSpace.small(),
                        ProductDetailCounter(
                          meal: widget.selectedProduct,
                        ),
                        const VerticalSpace.small(),
                        const CustomDivider(),
                        _ProductDetail(context),
                        const CustomDivider(),
                        _ProductDetailNutritions(context),
                        _ProductDetailReview(context),
                        const VerticalSpace.small(),
                        CustomGeneralAppButton(
                            buttonText: 'Add To Basket',
                            onTap: () {
                              if (context.read<HomeBloc>().state.index == 0) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor: Color(0xffF3603F),
                                  content: Center(
                                      child: Text('Please add some quantity')),
                                  duration: Duration(seconds: 1),
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor:
                                      ColorConstants.lightGreenColor,
                                  content: Center(child: Text('Added to cart')),
                                  duration: Duration(seconds: 2),
                                ));
                                context.pop();
                                context
                                    .read<HomeBloc>()
                                    .add(UpdateClearIndex());
                              }

                              for (int i = 0;
                                  i < context.read<HomeBloc>().state.index;
                                  i++) {
                                context.read<CartBloc>().add(
                                    AddToHiveCartEvent(widget.selectedProduct));
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Column ProductDetailFavRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedProduct.strIngredient2.toString(),
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: "Gilroy-Bold",
                fontSize: 24,
                color: const Color(0xff181725),
              ),
            ),
            LikeButton(
              animationDuration: const Duration(milliseconds: 1500),
              onTap: (bool isLiked) {
                final favBloc = context.read<FavouriteBloc>();
                final isFavourite =
                    favBloc.state.favourites.contains(widget.selectedProduct);

                if (isFavourite) {
                  favBloc.add(RemoveFromFavouriteEvent(widget.selectedProduct));
                } else {
                  favBloc.add(AddToFavouriteEvent(widget.selectedProduct));
                }

                return Future.value(!isLiked);
              },
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: context
                          .watch<FavouriteBloc>()
                          .state
                          .favourites
                          .contains(widget.selectedProduct)
                      ? const Color(0xffF3603F)
                      : ColorConstants.lightGreyColor,
                  size: 22,
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                widget.selectedProduct.strMeasure6 ?? '',
                style: context.textTheme.headlineLarge?.copyWith(
                  color: ColorConstants.lightGreyColor,
                  fontFamily: "Gilroy-Medium",
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              ",",
              style: context.textTheme.headlineLarge?.copyWith(
                color: ColorConstants.lightGreyColor,
                fontFamily: "Gilroy-Medium",
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            Flexible(
              child: Text(
                widget.selectedProduct.strMeasure2 ?? '',
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
      ],
    );
  }

  Column _ProductDetailReview(BuildContext context) {
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
                        .add(RatingStars(v, widget.selectedProduct));
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

  Column _ProductDetailNutritions(BuildContext context) {
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
                      style: context.textTheme.headlineLarge?.copyWith(
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
                    setState(() {});
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

  Column _ProductDetail(BuildContext context) {
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
                  _isExpanded = !_isExpanded;
                });
              },
              child: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
              ),
            )
          ],
        ),
        if (_isExpanded)
          Column(
            children: [
              const VerticalSpace.small(),
              Text(
                widget.selectedProduct.strInstructions.toString(),
                style: context.textTheme.headlineLarge?.copyWith(
                  color: ColorConstants.lightGreyColor,
                  fontFamily: "Gilroy-Medium",
                  fontSize: 13,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class ProductDetailButton extends StatelessWidget {
  const ProductDetailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.dynamicWidth(0.89),
        decoration: BoxDecoration(
          color: ColorConstants.lightGreenColor,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Padding(
          padding: context.paddingAllDefault + context.paddingVerticalLow * 0.7,
          child: Center(
            child: Text(
              "Add To Basket",
              style: context.textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
                    color: const Color(0xFFE0E0E0),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: context.paddingAllLow,
                  child: const Icon(
                    Icons.remove,
                    color: Color(0xffB3B3B3),
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
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF000000),
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
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
                    color: const Color(0xFFE0E0E0),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: context.paddingAllLow,
                  child: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          "\$${meal.price}",
          style: context.textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF181725),
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        )
      ],
    );
  }
}
