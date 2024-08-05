import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_checkout_info.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_chekout_list_card.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/all_product_page.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CartBottomSheet extends StatefulWidget {
  @override
  _CartBottomSheetState createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace.xSmall(),
              Padding(
                padding: context.paddingAllDefault +
                    context.paddingHorizontalDefault,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Checkout',
                      style: context.textTheme.headlineSmall,
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cancel.svg',
                        width: NumberConstants.thirteen,
                        color: ColorConstants.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
              const CartChekoutListCard(),
              const CartCheckoutInfo(),
              const VerticalSpace.xSmall(),
              CustomAllButton(
                height:
                    context.dynamicHeight(NumberConstants.zeroPointZeroNine),
                text: "Place Order",
                onTap: () {
                  context.push("/cart_page_accepted");
                  context.read<CartBloc>().add(ClearHiveCartEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
