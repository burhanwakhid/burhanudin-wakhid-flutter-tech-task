import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String _date = "date";

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<String> getdate() async 
{
  final SharedPreferences prefs = await _prefs;
  return prefs.getString(_date) ?? false;
}

Future<bool> setDate(String value) async
{
  final SharedPreferences prefs = await _prefs;
  return prefs.setString(_date, value);
}

