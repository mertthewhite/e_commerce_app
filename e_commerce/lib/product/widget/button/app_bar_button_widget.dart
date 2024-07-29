import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppBarButtonWidget extends StatelessWidget {
  const AppBarButtonWidget({
    required this.onPressed,
    required this.icon,
    required this.color,
    super.key,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: context.dynamicHeight(0.05),
        width: context.dynamicWidth(0.1),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
      color: Colors.white,
    );
  }
}
