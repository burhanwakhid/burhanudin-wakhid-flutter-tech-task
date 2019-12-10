
import 'package:tech_task/src/api/api.dart';
import 'package:tech_task/src/constant/data.dart';
import 'package:tech_task/src/model/ingredient_model.dart';
import 'package:tech_task/src/provider/base_model.dart';

class IngredientProvider extends BaseModel {

  final _api = Api();

  // getter and setter list ingredient
  List<IngredientModel> _ingredient = [];
  List<IngredientModel> get listIngredient => _ingredient;
  set listIngredient(List<IngredientModel> val) {
    _ingredient.clear();
    _ingredient.addAll(val);
    notifyListeners();
  }

  // list ingredient picked
  List<String> _ingredientPicked = [];

  // sort ingredient by date
  void _sortByDate(){
    listIngredient.sort((a, b) => b.useBy.compareTo(a.useBy));
  }

  Future<void> fetchData() async {
    setBusy();

    // listIngredient = await _api.getIngredients();
     await Future.delayed(Duration(milliseconds: 500));
    listIngredient = ingredientsData.map((recipe) => IngredientModel.fromJson(recipe)).toList();
    print(listIngredient);
    _sortByDate();
    setIdle();
  }

  // pick ingredient
  void chooseIngredient(String title){
    bool isPicked;
    listIngredient.forEach((ing){
      if(ing.title == title){
        ing.picked = !ing.picked;
        isPicked = ing.picked;
      }
    });
    if(isPicked){
      _ingredientPicked.add(title);
    }else{
      _ingredientPicked.remove(title);
    }
    print(_ingredientPicked);
    notifyListeners();
  }
}