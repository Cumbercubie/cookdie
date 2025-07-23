class Recipe {
  int? id;
  String? title;
  String? cuisine;
  List<String?>? tags;
  List<String>? ingredients;
  List<String>? banner_images;
  int? meal_size;
  int? serving_size;
  List<Steps>? steps;
  int usage = 0;
}


class Steps {
  String? content;
  List<String>? images;
}


class RecipeCookHistory {
  int recipeId = 0;
  DateTime? cookDate;
  String? feedback;
  double? rating;
  int userId = 0;

}