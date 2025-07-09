import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/core/styles/app_colors.dart';
import 'package:weather_task/core/values/values.dart';
import 'package:weather_task/features/weather/view/providers/weather_provider.dart';

import '../../core/routes/route_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        final weatherProvider = Provider.of<WeatherProvider>(
          context,
          listen: false,
        );
        weatherProvider.loadCachedWeather();
        context.pushReplacementNamed(RoutePaths.weather);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          Values.appName,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
