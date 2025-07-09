import 'package:flutter/material.dart';
import 'package:weather_task/core/routes/router.dart';
import 'package:weather_task/core/styles/theme/app_theme.dart';
import 'package:weather_task/core/values/values.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: Values.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
    );
  }
}
