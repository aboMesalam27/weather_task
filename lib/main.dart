import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_task/core/app/weather_app.dart';
import 'package:weather_task/features/weather/view/providers/weather_provider.dart';
import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// load .env file from root folder
  await dotenv.load();

  /// setup dependency injection
  await setupGetIt();

  /// initialize hive
  await Hive.initFlutter();

  /// open hive box for caching
  await Hive.openBox('weatherBox');
  runApp(
    ChangeNotifierProvider(
      create: (_) => getItInstance<WeatherProvider>(),
      child: const WeatherApp(),
    ),
  );
}
