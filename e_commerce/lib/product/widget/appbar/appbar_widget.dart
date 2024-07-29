import 'package:flutter/material.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String iconPath;
  final Function onTap;
  final bool? isHaveAcions;
  final String? actionsIconPath;
  final Function()? actionOnTap;
  final Color? color;

  AppbarWidget(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap,
      this.isHaveAcions = false,
      this.actionsIconPath,
      this.color,
      this.actionOnTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.colorScheme.background,
      title: Text(
        title,
        style: context.textTheme.bodyMedium,
      ),
      leadingWidth: context.dynamicWidth(0.17),
      leading: Padding(
        padding: context.paddingAllLow + context.paddingHorizontalLow,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(4),
          ),
          child: InkWell(
            onTap: () => onTap(),
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      actions: [
        isHaveAcions == true
            ? Padding(
                padding: context.paddingAllLow + context.paddingHorizontalLow,
                child: Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: actionOnTap,
                    child: SvgPicture.asset(
                      color: color,
                      actionsIconPath ?? 'assets/icons/profile_icon.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
