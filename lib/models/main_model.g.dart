// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainModel _$MainModelFromJson(Map<String, dynamic> json) => MainModel(
      height: json['height'] as int,
      weight: json['weight'] as int,
      bmi: (json['bmi'] as num).toDouble(),
      firstQuestion: $enumDecode(_$ANSWERSEnumMap, json['firstQuestion']),
      secondQuestion: $enumDecode(_$ANSWERSEnumMap, json['secondQuestion']),
      thirdQuestion: $enumDecode(_$ANSWERSEnumMap, json['thirdQuestion']),
      fourthQuestion: $enumDecode(_$ANSWERSEnumMap, json['fourthQuestion']),
      fifthQuestion: $enumDecode(_$ANSWERSEnumMap, json['fifthQuestion']),
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'bmi': instance.bmi,
      'firstQuestion': _$ANSWERSEnumMap[instance.firstQuestion],
      'secondQuestion': _$ANSWERSEnumMap[instance.secondQuestion],
      'thirdQuestion': _$ANSWERSEnumMap[instance.thirdQuestion],
      'fourthQuestion': _$ANSWERSEnumMap[instance.fourthQuestion],
      'fifthQuestion': _$ANSWERSEnumMap[instance.fifthQuestion],
    };

const _$ANSWERSEnumMap = {
  ANSWERS.YES: 'YES',
  ANSWERS.NO: 'NO',
};
