import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmtyWidget extends StatelessWidget {
  const EmtyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/unfound.json',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Text(
            "Your cart is empty",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.black,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
