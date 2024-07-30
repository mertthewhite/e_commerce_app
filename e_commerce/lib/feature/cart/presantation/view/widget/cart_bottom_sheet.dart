import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/cart/presantation/view/cart_page.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_checkout_info.dart';
import 'package:e_commerce/feature/cart/presantation/view/widget/cart_chekout_list_card.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/all_product_page.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
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
  final List<String> options = [
    'Red ',
    'Oil',
    'Onion',
    'Eggs',
    'Fast Food',
    'Individual Callection',
    'Cocola',
    'Wine'
  ];
  final List<String> headers = ['Categories', 'Brand'];
  final Map<String, bool> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    for (var option in options) {
      selectedOptions[option] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontFamily: "Gilroy",
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cancel.svg',
                        width: 13,
                        color: const Color(0xFF181725),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xffE2E2E2),
                thickness: 1,
              ),
              const CartChekoutListCard(),
              const CartCheckoutInfo(),
              const VerticalSpace.xSmall(),
              CustomAllButton(
                height: context.dynamicHeight(0.09),
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
