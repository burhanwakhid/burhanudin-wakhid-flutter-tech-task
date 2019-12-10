import 'package:flutter/material.dart';
// import 'package:tech_task/src/api/api.dart';
import 'package:tech_task/src/model/ingredient_model.dart';
// import 'dart:convert';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var ingredient = new List<IngredientModel>();
  @override
  void initState() {
    // Api.getIngredients().then((val){
    //   setState(() {
    //     ingredient = val;
    //     // print(val);
    //   });
    // });
    // Api.getIngredients().then((value) {
    //   setState(() {
    //     final list = json.decode(value.body);
    //     ingredient = list
    //         .map<IngredientModel>((json) => new IngredientModel.fromJson(json))
    //         .toList();
    //   });
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ingredient != null ? 
      ListView.builder(
        itemCount: ingredient.length,
        itemBuilder: (BuildContext context, i) {
          return Text(ingredient[i].title);
        },
      ):Container(),
    );
  }
}