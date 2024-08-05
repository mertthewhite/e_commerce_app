part of '../../all_product_page.dart';

class CustomAllButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double? height;
  final double? width;

  const CustomAllButton({
    super.key,
    this.onTap,
    required this.text,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? context.dynamicHeight(0.11),
          width: width ?? context.dynamicWidth(0.89),
          decoration: BoxDecoration(
            color: ColorConstants.lightGreenColor,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Padding(
            padding: context.paddingAllDefault,
            child: Center(
              child: Text(
                text,
                style: context.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
