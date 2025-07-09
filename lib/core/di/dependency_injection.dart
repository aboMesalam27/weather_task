import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_task/core/networking/api_service.dart';
import 'package:weather_task/core/networking/dio_factory.dart';
import 'package:weather_task/features/weather/data/repo/weather_repo_impl.dart';
import 'package:weather_task/features/weather/domain/repo/weather_repo.dart';
import 'package:weather_task/features/weather/domain/usecases/weather_uc.dart';
import 'package:weather_task/features/weather/view/providers/weather_provider.dart';
import 'package:weather_task/features/weather/view/services/weather_cache_service.dart';


final GetIt getItInstance = GetIt.instance;

/// Dependency Injection setup
Future<void> setupGetIt() async {
  /// Dio & ApiService & WeatherCacheService
  Dio dio = await DioFactory.getDio();
  getItInstance.registerLazySingleton<ApiService>(() => ApiService(dio));

  getItInstance.registerLazySingleton<WeatherCacheService>(
    () => WeatherCacheService(),
  );

  /// Repos
  getItInstance.registerLazySingleton<WeatherRepo>(
    () => WeatherRepoImpl(getItInstance()),
  );

  /// UseCases
  getItInstance.registerLazySingleton<WeatherUseCase>(
    () => WeatherUseCase(getItInstance()),
  );

  /// Cubits
  getItInstance.registerFactory<WeatherProvider>(
    () => WeatherProvider(getItInstance(), getItInstance()),
  );
}
