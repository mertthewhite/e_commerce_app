import 'package:hive/hive.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';

class MealModelAdapter extends TypeAdapter<MealModel> {
  @override
  final typeId = 1;

  @override
  MealModel read(BinaryReader reader) {
    return MealModel(
      idMeal: reader.readString(),
      strMeal: reader.readString(),
      strDrinkAlternate: reader.readString(),
      strCategory: reader.readString(),
      strArea: reader.readString(),
      strInstructions: reader.readString(),
      strMealThumb: reader.readString(),
      strTags: reader.readString(),
      strYoutube: reader.readString(),
      strIngredient1: reader.readString(),
      strIngredient2: reader.readString(),
      strIngredient3: reader.readString(),
      strIngredient4: reader.readString(),
      strIngredient5: reader.readString(),
      strIngredient6: reader.readString(),
      strIngredient7: reader.readString(),
      strIngredient8: reader.readString(),
      strIngredient9: reader.readString(),
      strIngredient10: reader.readString(),
      strIngredient11: reader.readString(),
      strIngredient12: reader.readString(),
      strIngredient13: reader.readString(),
      strIngredient14: reader.readString(),
      strIngredient15: reader.readString(),
      strIngredient16: reader.readString(),
      strIngredient17: reader.readString(),
      strIngredient18: reader.readString(),
      strIngredient19: reader.readString(),
      strIngredient20: reader.readString(),
      strMeasure1: reader.readString(),
      strMeasure2: reader.readString(),
      strMeasure3: reader.readString(),
      strMeasure4: reader.readString(),
      strMeasure5: reader.readString(),
      strMeasure6: reader.readString(),
      strMeasure7: reader.readString(),
      strMeasure8: reader.readString(),
      strMeasure9: reader.readString(),
      strMeasure10: reader.readString(),
      strMeasure11: reader.readString(),
      strMeasure12: reader.readString(),
      strMeasure13: reader.readString(),
      strMeasure14: reader.readString(),
      strMeasure15: reader.readString(),
      strMeasure16: reader.readString(),
      strMeasure17: reader.readString(),
      strMeasure18: reader.readString(),
      strMeasure19: reader.readString(),
      strMeasure20: reader.readString(),
      strSource: reader.readString(),
      strImageSource: reader.readString(),
      strCreativeCommonsConfirmed: reader.readString(),
      dateModified: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, MealModel obj) {
    writer.writeString(obj.idMeal ?? '');
    writer.writeString(obj.strMeal ?? '');
    writer.writeString(obj.strDrinkAlternate ?? '');
    writer.writeString(obj.strCategory ?? '');
    writer.writeString(obj.strArea ?? '');
    writer.writeString(obj.strInstructions ?? '');
    writer.writeString(obj.strMealThumb ?? '');
    writer.writeString(obj.strTags ?? '');
    writer.writeString(obj.strYoutube ?? '');
    writer.writeString(obj.strIngredient1 ?? '');
    writer.writeString(obj.strIngredient2 ?? '');
    writer.writeString(obj.strIngredient3 ?? '');
    writer.writeString(obj.strIngredient4 ?? '');
    writer.writeString(obj.strIngredient5 ?? '');
    writer.writeString(obj.strIngredient6 ?? '');
    writer.writeString(obj.strIngredient7 ?? '');
    writer.writeString(obj.strIngredient8 ?? '');
    writer.writeString(obj.strIngredient9 ?? '');
    writer.writeString(obj.strIngredient10 ?? '');
    writer.writeString(obj.strIngredient11 ?? '');
    writer.writeString(obj.strIngredient12 ?? '');
    writer.writeString(obj.strIngredient13 ?? '');
    writer.writeString(obj.strIngredient14 ?? '');
    writer.writeString(obj.strIngredient15 ?? '');
    writer.writeString(obj.strIngredient16 ?? '');
    writer.writeString(obj.strIngredient17 ?? '');
    writer.writeString(obj.strIngredient18 ?? '');
    writer.writeString(obj.strIngredient19 ?? '');
    writer.writeString(obj.strIngredient20 ?? '');
    writer.writeString(obj.strMeasure1 ?? '');
    writer.writeString(obj.strMeasure2 ?? '');
    writer.writeString(obj.strMeasure3 ?? '');
    writer.writeString(obj.strMeasure4 ?? '');
    writer.writeString(obj.strMeasure5 ?? '');
    writer.writeString(obj.strMeasure6 ?? '');
    writer.writeString(obj.strMeasure7 ?? '');
    writer.writeString(obj.strMeasure8 ?? '');
    writer.writeString(obj.strMeasure9 ?? '');
    writer.writeString(obj.strMeasure10 ?? '');
    writer.writeString(obj.strMeasure11 ?? '');
    writer.writeString(obj.strMeasure12 ?? '');
    writer.writeString(obj.strMeasure13 ?? '');
    writer.writeString(obj.strMeasure14 ?? '');
    writer.writeString(obj.strMeasure15 ?? '');
    writer.writeString(obj.strMeasure16 ?? '');
    writer.writeString(obj.strMeasure17 ?? '');
    writer.writeString(obj.strMeasure18 ?? '');
    writer.writeString(obj.strMeasure19 ?? '');
    writer.writeString(obj.strMeasure20 ?? '');
    writer.writeString(obj.strSource ?? '');
    writer.writeString(obj.strImageSource ?? '');
    writer.writeString(obj.strCreativeCommonsConfirmed ?? '');
    writer.writeString(obj.dateModified ?? '');
  }
}
