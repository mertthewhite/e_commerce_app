class MealCategoryModel {
  MealCategoryModel({
    required this.meals,
  });

  final List<MealCategory> meals;

  factory MealCategoryModel.fromJson(Map<String, dynamic> json) {
    // JSON'dan gelen "meals" anahtarının bir liste olduğundan emin olun
    final mealsJson = json["meals"];
    if (mealsJson is List) {
      return MealCategoryModel(
        meals: mealsJson
            .map((x) => MealCategory.fromJson(x as Map<String, dynamic>))
            .toList(),
      );
    } else {
      return MealCategoryModel(
        meals: [], // Eğer "meals" listesi yoksa boş bir liste dön
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
    };
  }
}

class MealCategory {
  MealCategory({
    required this.strCategory,
  });

  final String strCategory;

  factory MealCategory.fromJson(Map<String, dynamic> json) {
    // JSON'dan gelen "strCategory" anahtarının bir String olduğundan emin olun
    final strCategoryJson = json['strCategory'];
    return MealCategory(
      strCategory: strCategoryJson is String
          ? strCategoryJson
          : '', // Null ve tür kontrolü
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "strCategory": strCategory,
    };
  }

  @override
  String toString() {
    return 'MealCategory(strCategory: $strCategory)';
  }
}
