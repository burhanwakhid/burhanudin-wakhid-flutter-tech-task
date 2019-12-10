import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tech_task/src/constant/env.dart';
import 'package:tech_task/src/model/ingredient_model.dart';
import 'package:tech_task/src/model/recipe_model.dart';

class Api {

  // get ingredient from endpoint
  Future<List<IngredientModel>> getIngredients() async{
    try{
      var url = urlApi+'/ingredients';
      var response = await http.get(url);
      List<dynamic> json = jsonDecode(response.body);
      var result = json.map((ingredient) => IngredientModel.fromJson(ingredient)).toList();
      return result;
    } catch(e) {
      return e;
    }
  }

  // get recipes from endpoint
  static Future getReciper(ingredient1, ingredient2) async {
    var url = urlApi + '/recipes?ingredients=$ingredient1,$ingredient2';
    var response = await http.get(url);
    return RecipeModel.fromJson(json.decode(response.body));
  }
}