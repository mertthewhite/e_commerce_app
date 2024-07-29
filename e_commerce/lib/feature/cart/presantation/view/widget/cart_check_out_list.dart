import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CartCheckOutList extends StatelessWidget {
  final String firstText;
  final String? secondText;
  final Widget? widget;
  final void Function()? onTap;
  final Widget? widget2;

  const CartCheckOutList({
    super.key,
    required this.firstText,
    this.secondText,
    this.widget2,
    this.onTap,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            context.paddingHorizontalDefault * 1.4 + context.paddingVerticalLow,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    firstText,
                    style: const TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontFamily: "Gilroy",
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      widget2 ??
                          Text(
                            secondText ?? '',
                            style: const TextStyle(
                              color: Color(0xFF181725),
                              fontFamily: "Gilroy",
                              fontSize: 14,
                            ),
                          ),
                      widget ??
                          const Icon(
                            Icons.keyboard_arrow_right,
                            size: 24,
                            color: Color(0xFF181725),
                          ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffE2E2E2),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
