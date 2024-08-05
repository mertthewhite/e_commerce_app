part of '../../all_product_page.dart';

class ActionShowModalBottomSheet extends StatelessWidget {
  final VoidCallback onFilterTap;

  const ActionShowModalBottomSheet({
    super.key,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onFilterTap,
      child: gen.Assets.icons.filter.svg(
        width: IconSize.xmedium.value,
      ),
    );
  }
}
