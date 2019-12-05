import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tech_task/src/env.dart';
import 'package:tech_task/src/model/recipe_model.dart';

class Api {

  // get ingredient from endpoint
  static Future getIngredients() async{
    try{
      var url = urlApi+'/ingredients';
      var response = await http.get(url);
      var data = response.body;
      print(json.decode(data));
      return response;
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