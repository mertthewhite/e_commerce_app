import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    // Ekran boyutlarına göre dinamik yüksekliği hesaplayın
    final double height =
        MediaQuery.of(context).size.height < 800 ? 70 : _toolbarHeight;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.avatarPath),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.name,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF181725),
                                fontFamily: "Gilroy-Bold",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onEditTap,
                      child: SvgPicture.asset(
                        'assets/icons/pencil.svg',
                        width: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4), // Küçük bir boşluk ekleyin
                Text(
                  widget.email,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFF7C7C7C),
                        fontFamily: "Gilroy",
                        fontSize: 12,
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
