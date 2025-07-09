import 'package:json_annotation/json_annotation.dart';

part 'condition_model.g.dart';
@JsonSerializable()
class ConditionModel {
  final String text;
  final String icon;
  @JsonKey(ignore: true)
  String? localIconPath;

  ConditionModel({required this.text, required this.icon, this.localIconPath});
  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson({
        ...json,
        'icon': 'https:${json['icon']}', // fix the URL scheme
      });
  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}