import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_task/core/networking/api_constants.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
part 'api_service.g.dart';
/// [ApiService] is used for handling api calls
@RestApi(baseUrl: ApiConstants.apiLiveBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.fetchWeather)
  Future<WeatherModel> fetchWeather(@Path('city') String city);
}
