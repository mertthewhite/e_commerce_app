import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String name;
  final String email;
  final String avatarPath;
  final VoidCallback? onEditTap;

  const ProfileAppBar({
    Key? key,
    required this.name,
    required this.email,
    required this.avatarPath,
    this.onEditTap,
  }) : super(key: key);

  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(_ProfileAppBarState._toolbarHeight);
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  static double _toolbarHeight = 90;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: context.paddingHorizontalDefault,
        child: Row(
          children: [
            CircleAvatar(
              radius: NumberConstants.thirty,
              backgroundImage: AssetImage(widget.avatarPath),
            ),
            const HorizontalSpace.xxSmall(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                    ),
                    const HorizontalSpace.xxSmall(),
                    GestureDetector(
                        onTap: widget.onEditTap,
                        child: Assets.icons.pencil.svg()),
                  ],
                ),
                Text(
                  widget.email,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ColorConstants.lightGreyColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
