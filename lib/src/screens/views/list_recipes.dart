import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/src/provider/ingredient_provider.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key key, @required this.ingredients}) : super(key: key);
  final List<String> ingredients;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IngredientProvider>(
      create: (_) => IngredientProvider(),
      child: DisplayRecipePage(ingredients: ingredients),
    );
  }
}

class DisplayRecipePage extends StatefulWidget {
  final List<String> ingredients;

  const DisplayRecipePage({Key key, @required this.ingredients}) : super(key: key);
  @override
  _DisplayRecipePageState createState() => _DisplayRecipePageState();
}

class _DisplayRecipePageState extends State<DisplayRecipePage> {
  @override
  void initState() {
    Provider.of<IngredientProvider>(context, listen: false).fetchRecipe(widget.ingredients);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Recipes Suggestion'),
      ),
      body: Column(
        children: <Widget>[
          Center(child: Text('Your Recipes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
          SizedBox(height: 10,),
          Flexible(
            child: Consumer<IngredientProvider>(
              builder: (context, model, _) => StreamBuilder<bool>(
                stream: model.isLoading,
                builder: (context, snapshot) {
                  if(snapshot.data == true){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: model.listRecipe.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(model.listRecipe[index].title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Ingredients: '),
                            Wrap(
                              children: <Widget>[
                                for(String ingredient in model.listRecipe[index].ingredients)Chip(
                                  backgroundColor:  widget.ingredients.contains(ingredient)?Colors.blue[300]:Colors.black12,
                                  label: Text(ingredient),
                                )
                              ],
                            )
                            ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );

  }
}