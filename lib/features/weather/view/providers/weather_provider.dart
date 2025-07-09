import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
import 'package:weather_task/features/weather/domain/usecases/weather_uc.dart';
import 'package:weather_task/features/weather/view/services/weather_cache_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherUseCase _weatherUseCase;
  final WeatherCacheService _cacheService;

  WeatherProvider(this._weatherUseCase, this._cacheService);

  WeatherModel? weather;
  bool loading = false;
  String? errorMessage;

  /// [fetchWeather] method is used to fetch the weather
  Future<void> fetchWeather(String city) async {
    if (city.trim().isEmpty) {
      _setError("City name cannot be empty.");
      return;
    }
    _setLoading(true);
    final result = await _weatherUseCase.fetchWeather(city: city);
    result.when(
      success: (WeatherModel model) async {
        weather = model;
        await _cacheService.cacheWeather(model);
        errorMessage = null;
      },
      failure: (error) {
        _setError(error.message.toString());
      },
    );

    _setLoading(false);
  }

  /// [loadCachedWeather] method is used to load the cached weather
  Future<void> loadCachedWeather() async {
    /// load cached weather
    final cached = await _cacheService.loadCachedWeather();
    if (cached != null) {
      // Restore the local icon file path
      final iconUrl = cached.current.condition.icon;

      /// get icon file name
      final filename = iconUrl.split('/').last;

      final dir = await getApplicationDocumentsDirectory();
      final localFilePath = '${dir.path}/$filename';

      final localFile = File(localFilePath);
      if (await localFile.exists()) {
        cached.current.condition.localIconPath = localFile.path;
        debugPrint("✅ Loaded local icon path: ${localFile.path}");
      } else {
        debugPrint("❌ Local icon file not found");
      }

      debugPrint("cached icon url: ${cached.current.condition.icon}");
      debugPrint(
        "cached local path: ${cached.current.condition.localIconPath}",
      );

      weather = cached;
      notifyListeners();
    }
  }

  /// [_setError] method is used to set the error message
  void _setError(String message) {
    errorMessage = message;
    Fluttertoast.showToast(msg: message);
    notifyListeners();
  }

  /// [_setLoading] method is used to set the loading state
  void _setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
