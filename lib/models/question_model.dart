import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  bool firstQuestion;
  bool secondQuestion;
  bool thirdQuestion;
  bool fourthQuestion;
  bool fifthQuestion;
  QuestionModel(this.firstQuestion, this.secondQuestion, this.thirdQuestion, this.fourthQuestion, this.fifthQuestion);
  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
