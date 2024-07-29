import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class IngredientThumbnail extends StatelessWidget {
  final String ingredient;

  final bool bigImage;
  final bool cart;

  IngredientThumbnail(
      {required this.ingredient, required this.bigImage, required this.cart});

  @override
  Widget build(BuildContext context) {
    String smallImageUrl =
        "https://www.themealdb.com/images/ingredients/$ingredient-Small.png";

    String largeImageUrl =
        "https://www.themealdb.com/images/ingredients/$ingredient.png";

    return Column(
      children: [
        Padding(
          padding: bigImage
              ? context.paddingHorizontalDefault * 5
              : cart
                  ? EdgeInsets.only(
                      right: context.dynamicWidth(0.1),
                    )
                  : context.paddingAllDefault * 1.9,
          child: CachedNetworkImage(
              imageUrl: bigImage ? largeImageUrl : smallImageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                    'assets/images/chicken.png',
                    width: 100,
                    height: 100,
                  )),
        ),
      ],
    );
  }
}

class IngredientMealThumbnail extends StatelessWidget {
  final String ingredient;

  IngredientMealThumbnail({required this.ingredient});

  @override
  Widget build(BuildContext context) {
    String largeImageUrl =
        "www.themealdb.com/api/json/v1/1/filter.php?i=$ingredient";

    return Column(
      children: [
        Padding(
          padding: context.paddingAllDefault * 1.7,
          child: CachedNetworkImage(
            imageUrl: largeImageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
