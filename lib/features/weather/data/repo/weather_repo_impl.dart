import 'package:weather_task/core/networking/api_error_handler.dart';
import 'package:weather_task/core/networking/api_result.dart';
import 'package:weather_task/core/networking/api_service.dart';
import 'package:weather_task/core/networking/dio_factory.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
import 'package:weather_task/features/weather/domain/repo/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  final ApiService _apiService;

  WeatherRepoImpl(this._apiService);

  @override
  Future<ApiResult<WeatherModel>> fetchWeather({required String city}) async {
    try {
      await DioFactory.getDio();
      final response = await _apiService.fetchWeather(city);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
