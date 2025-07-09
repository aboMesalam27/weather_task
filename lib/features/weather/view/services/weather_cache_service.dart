import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';

class WeatherCacheService {
  static const String _boxName = 'weatherBox';
  static const String _key = 'cached_weather';

  final Dio _dio = Dio();

  /// [cacheWeather] method is used to cache the weather
  Future<void> cacheWeather(WeatherModel model) async {
    // Download and save icon image
    final iconUrl = model.current.condition.icon;
    final iconPath = await _downloadAndSaveImage(iconUrl);

    if (iconPath != null) {
      model.current.condition.localIconPath = iconPath;
      debugPrint("iconPath: $iconPath");
    }

    final box = Hive.box(_boxName);
    await box.put(_key, json.encode(model.toJson()));
  }

  Future<WeatherModel?> loadCachedWeather() async {
    final box = Hive.box(_boxName);
    final cached = box.get(_key);
    if (cached != null) {
      try {
        final data = json.decode(cached);
        return WeatherModel.fromJson(data);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  /// [downloadAndSaveImage] method is used to download and save the image
  Future<String?> _downloadAndSaveImage(String url) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filename = url.split('/').last;
      final file = File('${dir.path}/$filename');

      if (!file.existsSync()) {
        final response = await _dio.get<List<int>>(
          url,
          options: Options(responseType: ResponseType.bytes),
        );
        await file.writeAsBytes(response.data!);
      }

      return file.path;
    } catch (_) {
      return null;
    }
  }
}
