import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class MealModel {
  @HiveField(0)
  String? idMeal;

  @HiveField(1)
  String? strMeal;

  @HiveField(2)
  String? strDrinkAlternate;

  @HiveField(3)
  String? strCategory;

  @HiveField(4)
  String? strArea;

  @HiveField(5)
  String? strInstructions;

  @HiveField(6)
  String? strMealThumb;

  @HiveField(7)
  String? strTags;

  @HiveField(8)
  String? strYoutube;

  @HiveField(9)
  String? strIngredient1;

  @HiveField(10)
  String? strIngredient2;

  @HiveField(11)
  String? strIngredient3;

  @HiveField(12)
  String? strIngredient4;

  @HiveField(13)
  String? strIngredient5;

  @HiveField(14)
  String? strIngredient6;

  @HiveField(15)
  String? strIngredient7;

  @HiveField(16)
  String? strIngredient8;

  @HiveField(17)
  String? strIngredient9;

  @HiveField(18)
  String? strIngredient10;

  @HiveField(19)
  String? strIngredient11;

  @HiveField(20)
  String? strIngredient12;

  @HiveField(21)
  String? strIngredient13;

  @HiveField(22)
  String? strIngredient14;

  @HiveField(23)
  String? strIngredient15;

  @HiveField(24)
  String? strIngredient16;

  @HiveField(25)
  String? strIngredient17;

  @HiveField(26)
  String? strIngredient18;

  @HiveField(27)
  String? strIngredient19;

  @HiveField(28)
  String? strIngredient20;

  @HiveField(29)
  String? strMeasure1;

  @HiveField(30)
  String? strMeasure2;

  @HiveField(31)
  String? strMeasure3;

  @HiveField(32)
  String? strMeasure4;

  @HiveField(33)
  String? strMeasure5;

  @HiveField(34)
  String? strMeasure6;

  @HiveField(35)
  String? strMeasure7;

  @HiveField(36)
  String? strMeasure8;

  @HiveField(37)
  String? strMeasure9;

  @HiveField(38)
  String? strMeasure10;

  @HiveField(39)
  String? strMeasure11;

  @HiveField(40)
  String? strMeasure12;

  @HiveField(41)
  String? strMeasure13;

  @HiveField(42)
  String? strMeasure14;

  @HiveField(43)
  String? strMeasure15;

  @HiveField(44)
  String? strMeasure16;

  @HiveField(45)
  String? strMeasure17;

  @HiveField(46)
  String? strMeasure18;

  @HiveField(47)
  String? strMeasure19;

  @HiveField(48)
  String? strMeasure20;

  @HiveField(49)
  String? strSource;

  @HiveField(50)
  String? strImageSource;

  @HiveField(51)
  String? strCreativeCommonsConfirmed;

  @HiveField(52)
  String? dateModified;

  @HiveField(53)
  double? rating; // Add this field

  double get price {
    if (strCategory == 'Dessert') return 5.99;
    if (strCategory == 'Side') return 3.99;
    if (strCategory == 'Seafood') return 2.99;
    if (strCategory == 'Main Course') return 12.99;
    return 7.99;
  }

  MealModel({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
    this.rating, // Add this field
  });

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);

  @override
  String toString() {
    return 'MealModel{idMeal: $idMeal, strMeal: $strMeal , rating: $rating}';
  }

  MealModel copyWith({
    String? idMeal,
    String? strMeal,
    String? strDrinkAlternate,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strMealThumb,
    String? strTags,
    String? strYoutube,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strIngredient16,
    String? strIngredient17,
    String? strIngredient18,
    String? strIngredient19,
    String? strIngredient20,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
    String? strMeasure16,
    String? strMeasure17,
    String? strMeasure18,
    String? strMeasure19,
    String? strMeasure20,
    String? strSource,
    String? strImageSource,
    String? strCreativeCommonsConfirmed,
    String? dateModified,
    double? rating,
  }) {
    return MealModel(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
      strCategory: strCategory ?? this.strCategory,
      strArea: strArea ?? this.strArea,
      strInstructions: strInstructions ?? this.strInstructions,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strTags: strTags ?? this.strTags,
      strYoutube: strYoutube ?? this.strYoutube,
      strIngredient1: strIngredient1 ?? this.strIngredient1,
      strIngredient2: strIngredient2 ?? this.strIngredient2,
      strIngredient3: strIngredient3 ?? this.strIngredient3,
      strIngredient4: strIngredient4 ?? this.strIngredient4,
      strIngredient5: strIngredient5 ?? this.strIngredient5,
      strIngredient6: strIngredient6 ?? this.strIngredient6,
      strIngredient7: strIngredient7 ?? this.strIngredient7,
      strIngredient8: strIngredient8 ?? this.strIngredient8,
      strIngredient9: strIngredient9 ?? this.strIngredient9,
      strIngredient10: strIngredient10 ?? this.strIngredient10,
      strIngredient11: strIngredient11 ?? this.strIngredient11,
      strIngredient12: strIngredient12 ?? this.strIngredient12,
      strIngredient13: strIngredient13 ?? this.strIngredient13,
      strIngredient14: strIngredient14 ?? this.strIngredient14,
      strIngredient15: strIngredient15 ?? this.strIngredient15,
      strIngredient16: strIngredient16 ?? this.strIngredient16,
      strIngredient17: strIngredient17 ?? this.strIngredient17,
      strIngredient18: strIngredient18 ?? this.strIngredient18,
      strIngredient19: strIngredient19 ?? this.strIngredient19,
      strIngredient20: strIngredient20 ?? this.strIngredient20,
      strMeasure1: strMeasure1 ?? this.strMeasure1,
      strMeasure2: strMeasure2 ?? this.strMeasure2,
      strMeasure3: strMeasure3 ?? this.strMeasure3,
      strMeasure4: strMeasure4 ?? this.strMeasure4,
      strMeasure5: strMeasure5 ?? this.strMeasure5,
      strMeasure6: strMeasure6 ?? this.strMeasure6,
      strMeasure7: strMeasure7 ?? this.strMeasure7,
      strMeasure8: strMeasure8 ?? this.strMeasure8,
      strMeasure9: strMeasure9 ?? this.strMeasure9,
      strMeasure10: strMeasure10 ?? this.strMeasure10,
      strMeasure11: strMeasure11 ?? this.strMeasure11,
      strMeasure12: strMeasure12 ?? this.strMeasure12,
      strMeasure13: strMeasure13 ?? this.strMeasure13,
      strMeasure14: strMeasure14 ?? this.strMeasure14,
      strMeasure15: strMeasure15 ?? this.strMeasure15,
      strMeasure16: strMeasure16 ?? this.strMeasure16,
      strMeasure17: strMeasure17 ?? this.strMeasure17,
      strMeasure18: strMeasure18 ?? this.strMeasure18,
      strMeasure19: strMeasure19 ?? this.strMeasure19,
      strMeasure20: strMeasure20 ?? this.strMeasure20,
      strSource: strSource ?? this.strSource,
      strImageSource: strImageSource ?? this.strImageSource,
      strCreativeCommonsConfirmed:
          strCreativeCommonsConfirmed ?? this.strCreativeCommonsConfirmed,
      dateModified: dateModified ?? this.dateModified,
      rating: rating ?? this.rating,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealModel &&
          runtimeType == other.runtimeType &&
          strIngredient2 == other.strIngredient2 &&
          idMeal == other.idMeal;

  @override
  int get hashCode => strIngredient2.hashCode ^ idMeal.hashCode;
}
