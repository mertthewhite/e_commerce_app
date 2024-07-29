class MealCategoryModel {
  MealCategoryModel({
    required this.meals,
  });

  final List<MealCategory> meals;

  factory MealCategoryModel.fromJson(Map<String, dynamic> json) {
    return MealCategoryModel(
      meals: json["meals"] == null
          ? []
          : List<MealCategory>.from(
              json["meals"].map((x) => MealCategory.fromJson(x))),
    );
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
    return MealCategory(
      strCategory: json["strCategory"],
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
