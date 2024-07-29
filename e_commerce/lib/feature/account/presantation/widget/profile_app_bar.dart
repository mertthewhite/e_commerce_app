import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [],
      toolbarHeight: 95,
      backgroundColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(avatarPath),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: const Color(0xFF181725),
                                fontFamily: "Gilroy-Bold",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: onEditTap,
                          child: SvgPicture.asset(
                            'assets/icons/pencil.svg',
                            width: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      email,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF7C7C7C),
                                fontFamily: "Gilroy",
                                fontSize: 12,
                              ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(95);
}
