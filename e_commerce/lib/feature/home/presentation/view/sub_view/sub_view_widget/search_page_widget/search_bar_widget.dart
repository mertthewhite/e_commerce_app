part of '../../search_page.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;

  const SearchBar({Key? key, required this.onSearchChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.containerBackground,
          borderRadius: context.borderRadiusCircular14,
        ),
        child: TextField(
          style: Theme.of(context).textTheme.bodySmall,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorConstants.lightGreyColor,
                ),
            prefixIcon: Padding(
              padding: context.paddingAllDefault,
              child: SvgPicture.asset(
                'assets/icons/search.svg', // Replace with the path to your SVG
                color: ColorConstants.lightGreyColor,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
