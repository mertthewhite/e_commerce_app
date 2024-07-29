import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTitleTap;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onTitleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(
            color: Color(0xffE2E2E2),
            thickness: 1,
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: InkWell(
        onTap: onTitleTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.black,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
