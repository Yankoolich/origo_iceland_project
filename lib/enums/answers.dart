// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum ANSWERS { YES, NO }

class AnswerPicker {
  static const ANSWERS DEFAULT_ANSWER = ANSWERS.NO;
  static String stringValue(ANSWERS answer) {
    return EnumToString.convertToString(answer);
  }

  static ANSWERS fromString(String value) {
    return EnumToString.fromString(ANSWERS.values, value) ?? DEFAULT_ANSWER;
  }
}
