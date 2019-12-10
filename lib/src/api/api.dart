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
      if(response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        var result = data.map((ingredient) => IngredientModel.fromJson(ingredient)).toList();
        return result;
      } else {
        throw Exception('Something error');
      }
    } catch(e) {
      return e;
    }
  }

  // get recipes from endpoint
  Future<List<RecipeModel>> getReciper(List<String> ingredients) async {
    try{
      var url = urlApi + '/recipes?ingredients=$ingredients';
      var response = await http.get(url);
      if(response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        var results = data.map((recipe) => RecipeModel.fromJson(recipe)).toList();
        return results;
      }else {
        throw Exception('Something error');
      }
    }catch(e) {
      return e;
    }
  }
}