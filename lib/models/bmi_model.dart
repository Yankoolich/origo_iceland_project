import 'package:json_annotation/json_annotation.dart';

part 'bmi_model.g.dart';

@JsonSerializable()
class BmiModel {
  int height;
  int weight;
  double bmi;
  BmiModel(this.height, this.weight, this.bmi);
  factory BmiModel.fromJson(Map<String, dynamic> json) => _$BmiModelFromJson(json);

  Map<String, dynamic> toJson() => _$BmiModelToJson(this);
}
