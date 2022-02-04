// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BmiModel _$BmiModelFromJson(Map<String, dynamic> json) => BmiModel(
      json['height'] as int,
      json['weight'] as int,
      (json['bmi'] as num).toDouble(),
    );

Map<String, dynamic> _$BmiModelToJson(BmiModel instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'bmi': instance.bmi,
    };
