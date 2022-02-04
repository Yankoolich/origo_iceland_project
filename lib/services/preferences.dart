// ignore_for_file: non_constant_identifier_names

import 'package:origo_iceland_project_app/enums/answers.dart';
import 'package:origo_iceland_project_app/main.dart';
import 'package:origo_iceland_project_app/models/main_model.dart';
import 'package:origo_iceland_project_app/screens/question_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PreferenceService {
  PreferenceService._();
  static late PreferenceService _instance;
  static late SharedPreferences _preferences;

  final String KEY_MAIN_MODEL = 'KEY_MAIN_MODEL';

  static Future<void> init() async {
    _instance = PreferenceService._();
    _preferences = await SharedPreferences.getInstance();
  }

  static PreferenceService getInstance() {
    return _instance;
  }

  set setMainModel(MainModel model) {
    _preferences.setString(KEY_MAIN_MODEL, jsonEncode(model));
  }

  get getMainModel {
    if (!_preferences.containsKey(KEY_MAIN_MODEL)) {
      MainModel defaultModel = MainModel(
          height: 0,
          weight: 0,
          bmi: 0,
          firstQuestion: ANSWERS.NO,
          secondQuestion: ANSWERS.NO,
          thirdQuestion: ANSWERS.NO,
          fourthQuestion: ANSWERS.NO,
          fifthQuestion: ANSWERS.NO);
      setMainModel = defaultModel;
    }
    return json.decode((_preferences.getString(KEY_MAIN_MODEL)!));
  }
}
