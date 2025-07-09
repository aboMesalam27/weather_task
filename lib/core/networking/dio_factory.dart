import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_task/core/networking/token_interceptor.dart';

const String applicationJson = "application/json";
const String bearer = "Bearer";

/// [apiKey] is used to get api key from .env file
String get apiKey => dotenv.env['API_KEY'] ?? "";

class DioFactory {
  DioFactory._();

  static Dio? dio;

  /// [getDio] is used to get dio instance
  static Future<Dio> getDio() async {
    if (dotenv.env['API_KEY'] == null) {
      await dotenv.load(fileName: ".env");
    }
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      dio?.options = BaseOptions(
        headers: {
          'Content-Type': applicationJson,
          'Accept': 'application/json',
        },
        followRedirects: false,
        receiveDataWhenStatusError: true,
      );
      dio?.options.queryParameters['key'] = apiKey;
      if (!kReleaseMode) {
        addDioInterceptor();
      }
    }

    return dio!;
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(TokenInterceptor(dio!));
    /// For development log
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: print,
      ),
    );
  }
}
