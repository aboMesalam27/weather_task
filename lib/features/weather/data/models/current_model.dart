import 'package:json_annotation/json_annotation.dart';
import 'condition_model.dart';
part 'current_model.g.dart';
@JsonSerializable()
class CurrentModel {
  final double temp_c;
  final ConditionModel condition;
  CurrentModel({required this.temp_c, required this.condition});
  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);
}