import 'package:flutter/material.dart';
import 'package:tech_task/src/screens/views/list_ingredient.dart';
import 'package:tech_task/src/splashscreen.dart';

class App extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/splashscreen': (context) => SplashScreen(),
    '/home': (context) => IngredientPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTask',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6D00),
        accentColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: SplashScreen(),
    );
  }
}