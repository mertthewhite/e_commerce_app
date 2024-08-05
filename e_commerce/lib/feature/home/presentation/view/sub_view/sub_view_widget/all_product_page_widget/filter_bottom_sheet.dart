part of '../../all_product_page.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<String> selectedFilters;

  const FilterBottomSheet({Key? key, required this.selectedFilters})
      : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> options = [
    'Vegetarian',
    'Side',
    'Seafood',
    'Dessert',
    'Fast Food',
    'Beef',
    'Pasta',
    'Wine'
  ];
  final List<String> headers = ['Categories', 'Brand'];
  late Map<String, bool> selectedOptions;

  @override
  void initState() {
    super.initState();
    selectedOptions = {
      for (var option in options)
        option: widget.selectedFilters.contains(option)
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: context.paddingHorizontalDefault,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cancel.svg',
                        width: 15,
                        color: const Color(0xFF181725),
                      ),
                    ),
                    const HorizontalSpace.small(),
                    const Text(
                      'Filters',
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontFamily: "Gilroy-Bold",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const HorizontalSpace.xLarge(),
                  ],
                ),
              ),
              const VerticalSpace.small(),
              Container(
                height: context.height * 0.87,
                decoration: const BoxDecoration(
                  color: ColorConstants.containerBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < options.length; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (i % 4 == 0)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  headers[i ~/ 4],
                                  style: const TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "Gilroy",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOptions[options[i]] =
                                      !selectedOptions[options[i]]!;
                                });
                                print(
                                    '${options[i]} selected: ${selectedOptions[options[i]]}');
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 19,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    activeColor: ColorConstants.lightGreenColor,
                                    checkColor: Colors.white,
                                    side: const BorderSide(
                                        color: Color(0xffB1B1B1)),
                                    value: selectedOptions[options[i]],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedOptions[options[i]] = value!;
                                      });
                                      print(
                                          '${options[i]} selected: ${selectedOptions[options[i]]}');
                                    },
                                  ),
                                  Text(
                                    options[i],
                                    style: TextStyle(
                                      color: selectedOptions[options[i]]!
                                          ? const Color(0xff53B175)
                                          : const Color(0xFF000000),
                                      fontFamily: "Gilroy-Medium",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      CustomAllButton(
                        text: 'Apply',
                        height: context.dynamicHeight(0.08),
                        onTap: () {
                          print(selectedOptions.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList());
                          Navigator.pop(
                            context,
                            selectedOptions.entries
                                .where((entry) => entry.value)
                                .map((entry) => entry.key)
                                .toList(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
