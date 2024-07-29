import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CartCheckoutInfo extends StatelessWidget {
  const CartCheckoutInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow + context.paddingHorizontalDefault,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "By placing an order you agree to our",
            style: TextStyle(
              color: Color(0xFF7C7C7C),
              fontFamily: "Gilroy",
              fontSize: 12,
            ),
          ),
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Gilroy",
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontFamily: "Gilroy",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Conditions',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Gilroy",
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
