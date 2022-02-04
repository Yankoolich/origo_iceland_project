import 'package:json_annotation/json_annotation.dart';
import 'package:origo_iceland_project_app/enums/answers.dart';

part 'main_model.g.dart';

@JsonSerializable()
class MainModel {
  int height;
  int weight;
  double bmi;
  ANSWERS firstQuestion;
  ANSWERS secondQuestion;
  ANSWERS thirdQuestion;
  ANSWERS fourthQuestion;
  ANSWERS fifthQuestion;
  MainModel(
      {required this.height,
      required this.weight,
      required this.bmi,
      required this.firstQuestion,
      required this.secondQuestion,
      required this.thirdQuestion,
      required this.fourthQuestion,
      required this.fifthQuestion});

  factory MainModel.fromJson(Map<String, dynamic> json) => _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}
