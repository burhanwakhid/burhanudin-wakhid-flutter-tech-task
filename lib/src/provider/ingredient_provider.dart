import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tech_task/src/model/ingredient_model.dart';

import '../env.dart';

class IngredientProvider with ChangeNotifier {
  List<IngredientModel> _ingredient;
  List<IngredientModel> get listIngredient => _ingredient;

  set listIngredient(List<IngredientModel> val) {
    _ingredient = val;
    notifyListeners();
  }

  Future<List<IngredientModel>> fetchData() async {
    final response = await http.get(urlApi+'/ingredients');
    final res = jsonDecode(response.body);

    var dataResponse = res;

    List<IngredientModel> data = [];

    for (var i = 0; i < dataResponse.length; i++) {
      var mypict = IngredientModel.fromJson(dataResponse[i]);
      data.add(mypict);
    }
    listIngredient = data;
    return listIngredient;
  }
}