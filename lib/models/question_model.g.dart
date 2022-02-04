// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      json['firstQuestion'] as bool,
      json['secondQuestion'] as bool,
      json['thirdQuestion'] as bool,
      json['fourthQuestion'] as bool,
      json['fifthQuestion'] as bool,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'firstQuestion': instance.firstQuestion,
      'secondQuestion': instance.secondQuestion,
      'thirdQuestion': instance.thirdQuestion,
      'fourthQuestion': instance.fourthQuestion,
      'fifthQuestion': instance.fifthQuestion,
    };
