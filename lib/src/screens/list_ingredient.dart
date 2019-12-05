import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/src/provider/ingredient_provider.dart';
class IngredientPage extends StatelessWidget {
    const IngredientPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IngredientProvider>.value(
      value: IngredientProvider(),
      child: DisplayListIngredient(),
    );
  }
}

class DisplayListIngredient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IngredientProvider ingredientProvider = Provider.of<IngredientProvider>(context);
    ingredientProvider.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: ingredientProvider.listIngredient != null ? 
      ListView.builder(
        itemCount: ingredientProvider.listIngredient.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(ingredientProvider.listIngredient[i].title),
            subtitle: Text(ingredientProvider.listIngredient[i].useBy),
          );
        },
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}