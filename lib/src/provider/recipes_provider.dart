import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tech_task/src/model/recipe_model.dart';

import 'package:tech_task/src/constant/env.dart';

class RecipeProvider with ChangeNotifier {
  List<RecipeModel> _recipe;
  List<RecipeModel> get listRecipe => _recipe;

  

  set listRecipe(List<RecipeModel> val) {
    _recipe = val;
    notifyListeners();
  }

  Future<List<RecipeModel>> fetchData(ingredient1, ingredient2) async {
    final response = await http.get(urlApi+'/recipes?ingredients=$ingredient1,$ingredient2');
    final res = jsonDecode(response.body);

    var dataResponse = res;

    List<RecipeModel> data = [];

    for (var i = 0; i < dataResponse.length; i++) {
      var mypict = RecipeModel.fromJson(dataResponse[i]);
      data.add(mypict);
    }
    listRecipe = data;
    return listRecipe;
  }
}