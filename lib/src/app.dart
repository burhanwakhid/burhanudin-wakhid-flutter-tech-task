import 'package:flutter/material.dart';
import 'package:tech_task/src/screens/list_ingredient.dart';
import 'package:tech_task/src/screens/list_recipes.dart';
import 'package:tech_task/src/splashscreen.dart';

class App extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/splashscreen': (context) => SplashScreen(),
    '/ingredient': (context) => IngredientPage(),
    '/recipe': (context) => RecipePage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTask',
      theme: ThemeData(
        primaryColor: const Color(0xFF01579B),
        accentColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: RecipePage(),
    );
  }
}