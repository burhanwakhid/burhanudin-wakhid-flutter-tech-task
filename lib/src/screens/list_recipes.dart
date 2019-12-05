import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/src/provider/recipes_provider.dart';

class RecipePage extends StatelessWidget {
    const RecipePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecipeProvider>.value(
      value: RecipeProvider(),
      child: DisplayRecipePage(),
    );
  }
}

class DisplayRecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: <Widget>[
            Text('data'),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingredient 1',
                helperText: 'Masukan Ingredient yang pertama',
                suffixStyle: TextStyle(color: Colors.green),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingredient 2',
                helperText: 'Masukan Ingredient yang kedua',
                suffixStyle: TextStyle(color: Colors.green),
              ),
            ),
            RaisedButton(
              onPressed: (){},
              child: Text('get recipes'),
            )
          ],
        ),
      ),
    );

  }
}