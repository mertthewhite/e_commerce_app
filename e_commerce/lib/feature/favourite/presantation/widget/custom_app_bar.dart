import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [],
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: context.textTheme.headlineMedium?.copyWith(
          color: const Color(0xFF000000),
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
