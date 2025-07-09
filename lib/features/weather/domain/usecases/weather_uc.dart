import 'package:weather_task/core/networking/api_result.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
import 'package:weather_task/features/weather/domain/repo/weather_repo.dart';

class WeatherUseCase {
  final WeatherRepo weatherRepo;

  WeatherUseCase(this.weatherRepo);

  Future<ApiResult<WeatherModel>> fetchWeather({required String city}) async =>
      await weatherRepo.fetchWeather(city: city);
}
