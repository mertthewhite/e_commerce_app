import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomGeneralAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final VoidCallback? onBackPressed;
  final bool? divider;

  const CustomGeneralAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.backgroundColor = Colors.transparent,
    this.onBackPressed,
    this.divider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: divider != null && divider == true
          ? Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorConstants.lightGreyColorDivider,
                  ),
                ),
              ),
            )
          : null,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBackPressed ?? () => context.pop(),
            )
          : null,
      automaticallyImplyLeading: false,
      actions: actions,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
