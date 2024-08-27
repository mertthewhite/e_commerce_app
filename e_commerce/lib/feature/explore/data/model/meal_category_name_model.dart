class MealCategoryNameModel {
  String? strCategory;

  MealCategoryNameModel({this.strCategory});

  MealCategoryNameModel.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strCategory'] = strCategory;
    return data;
  }
}
