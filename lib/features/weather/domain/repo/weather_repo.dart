import 'package:weather_task/core/networking/api_result.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';

abstract class WeatherRepo {
  Future<ApiResult<WeatherModel>> fetchWeather({required String city});
}
