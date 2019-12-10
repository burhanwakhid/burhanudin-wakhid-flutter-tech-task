class IngredientModel {
  String title;
  DateTime useBy;
  bool picked;

  String get date {
    return useBy.toString().substring(0, 10);
  } 

  IngredientModel({this.title, this.useBy, this.picked: false});

  // IngredientModel.fromJson(Map<String, dynamic> json) {
  //   title = json['title'];
  //   useBy = json['use-by'];
  // }

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      title: json['title'],
      useBy: DateTime.parse(json['use-by'] as String)
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['use-by'] = this.useBy;
    return data;
  }
}
