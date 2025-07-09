// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) => CurrentModel(
  temp_c: (json['temp_c'] as num).toDouble(),
  condition: ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurrentModelToJson(CurrentModel instance) =>
    <String, dynamic>{
      'temp_c': instance.temp_c,
      'condition': instance.condition,
    };
