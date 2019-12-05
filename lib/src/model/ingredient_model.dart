// class IngredientModel {
//   String title;
//   String useBy;

//   IngredientModel({this.title, this.useBy});

//   IngredientModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     useBy = json['use-by'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['use-by'] = this.useBy;
//     return data;
//   }
// }
class IngredientModel {
  String title;
  String useBy;

  IngredientModel({this.title, this.useBy});

  // IngredientModel.fromJson(Map<String, dynamic> json) {
  //   title = json['title'];
  //   useBy = json['use-by'];
  // }

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      title: json['title'],
      useBy: json['use-by']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['use-by'] = this.useBy;
    return data;
  }
}
