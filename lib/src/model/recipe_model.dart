// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelToJson(List<RecipeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
    String title;
    List<String> ingredients;

    RecipeModel({
        this.title,
        this.ingredients,
    });

    factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        title: json["title"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    };
}
