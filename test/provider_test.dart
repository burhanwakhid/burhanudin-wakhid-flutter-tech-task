import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/src/provider/ingredient_provider.dart';

void main() {
  group("Provider Test", () {
    var ingredientProvider = IngredientProvider();
    test("Get Ingredients", () async {
      await ingredientProvider.fetchData();
      print("Ingredient: ${ingredientProvider.listIngredient.first.useBy}");
      expect(ingredientProvider.listIngredient.length, 16);
    });

    test("Get Recipes", () async{
      var ingredients = ['Cheese', 'Bread'];
      await ingredientProvider.fetchRecipe(ingredients);
      print("Recipes: ${ingredientProvider.listRecipe.first.title}");
      expect(ingredientProvider.listRecipe.first.title != null, true);
    });
  });
}
