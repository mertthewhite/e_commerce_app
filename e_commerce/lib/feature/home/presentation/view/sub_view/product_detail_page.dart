import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart' as rate;
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';

import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/product_detail_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/duration_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';
import 'package:e_commerce/product/utility/size/index.dart';
import 'package:e_commerce/product/widget/button/custom_general_app_button.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';

part 'sub_view_widget/product_detail_widget/product_detail_fav_row.dart';
part 'sub_view_widget/product_detail_widget/product_detail_review.dart';
part 'sub_view_widget/product_detail_widget/product_detail_counter.dart';
part 'sub_view_widget/product_detail_widget/product_detail_widget.dart';
part 'sub_view_widget/product_detail_widget/product_detail_nutritions.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.selectedProduct});
  final MealModel selectedProduct;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

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
                  ProductDetailAppbar(),
                  Container(
                    height:
                        context.dynamicHeight(NumberConstants.zeroPointFour),
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
                        ProductDetailFavRow(
                            selectedProduct: widget.selectedProduct),
                        const VerticalSpace.small(),
                        ProductDetailCounter(
                          meal: widget.selectedProduct,
                        ),
                        const VerticalSpace.small(),
                        const CustomDivider(),
                        ProductDetail(selectedProduct: widget.selectedProduct),
                        const CustomDivider(),
                        ProductDetailNutritions(
                            selectedProduct: widget.selectedProduct),
                        ProductDetailReview(
                            selectedProduct: widget.selectedProduct),
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
}

class ProductDetailAppbar extends StatelessWidget {
  const ProductDetailAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
