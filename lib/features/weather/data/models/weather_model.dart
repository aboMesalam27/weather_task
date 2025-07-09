import 'package:json_annotation/json_annotation.dart';

import 'current_model.dart';
import 'location_model.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final LocationModel location;
  final CurrentModel current;
  WeatherModel({required this.location, required this.current});
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
