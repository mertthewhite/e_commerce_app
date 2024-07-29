import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CounterButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: icon == Icons.add ? Colors.green : const Color(0xffB3B3B3),
          ),
        ),
      ),
    );
  }
}

class CartProductCounter extends StatelessWidget {
  final MealModel meal;
  final int count;

  const CartProductCounter({
    Key? key,
    required this.meal,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterButton(
          icon: Icons.remove,
          onTap: () {
            context.read<CartBloc>().add(RemoveFromCartEvent(meal));
          },
        ),
        const SizedBox(width: 12),
        Text(
          count.toString(),
          style: const TextStyle(
            color: Color(0xFF181725),
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 12),
        CounterButton(
          icon: Icons.add,
          onTap: () {
            context.read<CartBloc>().add(AddToHiveCartEvent(meal));
          },
        ),
      ],
    );
  }
}

class CartProductDetail extends StatelessWidget {
  final MealModel meal;

  const CartProductDetail({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.strIngredient2 ?? 'Unknown Ingredient',
          style: const TextStyle(
            color: Color(0xFF181725),
            fontFamily: "Gilroy-Bold",
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            Text(
              meal.strMeasure6 ?? 'Unknown Measure',
              style: const TextStyle(
                color: Color(0xFF7C7C7C),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            const Text(
              ",",
              style: TextStyle(
                color: Color(0xFF7C7C7C),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Text(
              meal.strMeasure2 ?? 'Unknown Measure',
              style: context.textTheme.headlineMedium?.copyWith(
                color: const Color(0xFF7C7C7C),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
