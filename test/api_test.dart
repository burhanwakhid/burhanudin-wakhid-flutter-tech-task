import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/src/api/api.dart';

void main() {
  group("REST API Test", () {
    var api = Api();
    test('Ingredient', () async {
      var result = await api.getIngredients();
      print('RESULT ${result.map((ingredient) => ingredient.title)}');
      expect(result != null, true);
    });

    test('Recipe', () async {
      var params = ['Ketchup', 'Cheese'];
      var result = await api.getReciper(params);
      print('RESULT ${result.map((recipe) => recipe.title)}');
      expect(result != null, true);
    });
  });
}
