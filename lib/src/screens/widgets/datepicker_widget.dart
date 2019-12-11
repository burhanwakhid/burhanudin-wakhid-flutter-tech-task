import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/src/provider/ingredient_provider.dart';

class DatePickerWidget extends StatelessWidget {
  final IconData icon;

  const DatePickerWidget({Key key, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<IngredientProvider>(
      builder: (context, model, _) => FloatingActionButton(
        onPressed: (){
              print('object');
              DatePicker.showDatePicker(context, 
                showTitleActions: true,
                minTime: DateTime(1900, 3, 5),
                maxTime: DateTime.now(),
                onChanged: (date){
                  print('Change $date');
                },
                onConfirm: (date){
                  print('confirm $date');
                  model.setIngredientDate(date);
                },
                currentTime: model.useBy, locale: LocaleType.id
              );
            },
            child: Icon(icon),
      ),
    );
  }
}