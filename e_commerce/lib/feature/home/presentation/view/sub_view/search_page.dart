import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/widget/ingredient_thumbnail.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<MealModel> allMeals = [];
  List<MealModel> filteredMeals = [];
  bool isLoading = false;
  bool hasError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadData(String search) async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final meals =
          await context.read<HomeBloc>().repository.fetchSearchMeals(search);
      setState(() {
        allMeals = meals;
        filteredMeals = meals;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
        errorMessage = e.toString();
      });
    }
  }

  void _onSearchChanged(String query) {
    loadData(query);
  }

  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop(context);
          },
        ),
        title: Text(
          'Search',
          style: context.textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF000000),
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: context.textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF000000),
                  fontSize: 16,
                ),
                textAlignVertical: TextAlignVertical.center,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: context.textTheme.headlineLarge
                      ?.copyWith(color: const Color(0xFFA1A1A1), fontSize: 16),
                  prefixIcon: Padding(
                    padding: context.paddingAllDefault,
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: const Color(0xFFA1A1A1),
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : hasError
                    ? Center(child: Text('Error: $errorMessage'))
                    : ListView.builder(
                        itemCount: filteredMeals.length,
                        itemBuilder: (context, index) {
                          final meal = filteredMeals[index];
                          return InkWell(
                            onTap: () {
                              GoRouter.of(context).push(
                                '/product_detail_page',
                                extra: {'selectedProduct': meal},
                              );
                            },
                            child: MealListItem(
                              meal: meal,
                              onAddToCart: (meal) {
                                context
                                    .read<CartBloc>()
                                    .add(AddToHiveCartEvent(meal));
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class MealListItem extends StatefulWidget {
  final MealModel meal;
  final bool isTapped;
  final Function(MealModel) onAddToCart;

  const MealListItem({
    Key? key,
    required this.meal,
    this.isTapped = false,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  _MealListItemState createState() => _MealListItemState();
}

class _MealListItemState extends State<MealListItem> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow + context.paddingHorizontalLow,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: IngredientThumbnail(
                      cart: false,
                      ingredient: widget.meal.strIngredient2.toString(),
                      bigImage: false,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.dynamicWidth(0.4),
                        child: Text(
                          widget.meal.strIngredient2 ?? '',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: const Color(0xFF000000),
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SearchInfoRow(meal: widget.meal),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isTapped = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isTapped = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _isTapped = false;
                  });
                },
                onTap: () {
                  widget.onAddToCart(widget.meal);
                },
                child: AnimatedScale(
                  scale: _isTapped ? 0.7 : 1.0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF53B175),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: context.paddingAllDefault * 0.8,
                      child: SvgPicture.asset(
                        'assets/icons/plus.svg',
                        width: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchInfoRow extends StatelessWidget {
  const SearchInfoRow({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.5),
      child: Row(
        children: [
          Text(
            meal.strMeasure6 ?? '',
            style: const TextStyle(
              color: Color(0xFF7C7C7C),
              fontFamily: "Gilroy-Medium",
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const Text(
            ",",
            style: TextStyle(
              color: Color(0xFF7C7C7C),
              fontFamily: "Gilroy-Medium",
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              meal.strMeasure2 ?? '',
              style: context.textTheme.headlineLarge?.copyWith(
                overflow: TextOverflow.ellipsis,
                color: const Color(0xFF7C7C7C),
                fontFamily: "Gilroy-Medium",
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
