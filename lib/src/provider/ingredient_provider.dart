
import 'package:tech_task/src/SharedPreference/sharedpreference.dart';
import 'package:tech_task/src/api/api.dart';
import 'package:tech_task/src/model/ingredient_model.dart';
import 'package:tech_task/src/model/recipe_model.dart';
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

  List<RecipeModel> listRecipe = [];

  // list ingredient picked
  List<String> ingredientPicked = [];

  DateTime _useBy = DateTime.now();

  DateTime get useBy => _useBy;

  String get getIngredientDate => _useBy.toString().substring(0, 10);
  // sort ingredient by date
  void _sortByDate(){
    listIngredient.sort((a, b) => b.useBy.compareTo(a.useBy));
  }

  // fetch data list ingredient
  Future<void> fetchData() async {
    setBusy();
    listIngredient = await _api.getIngredients();
    print(listIngredient);
    _sortByDate();
    setIdle();
  }

  // fetch data list recipe
  Future<void> fetchRecipe(List<String> ingredients) async {
    setBusy();
    listRecipe = await _api.getReciper(ingredients);
    setIdle();
  }

  // check date
  bool checkDate(int index){
    var status = listIngredient[index].useBy.compareTo(_useBy);
    if(status.isNegative){
      return false;
    }else{
      return true;
    }
  }

  // set date
  void setIngredientDate(DateTime time)async {
    // final preference = await PreferenceService.getInstance();
    _useBy = time;
    await setDate(getIngredientDate);

    listIngredient.forEach((ing){
      var dateCompare = ing.useBy.compareTo(_useBy);
      if(dateCompare.isNegative){
        ing.picked = false;
        ingredientPicked.remove(ing.title);
      }
    });
    notifyListeners();
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
      ingredientPicked.add(title);
    }else{
      ingredientPicked.remove(title);
    }
    print(ingredientPicked);
    notifyListeners();
  }
}