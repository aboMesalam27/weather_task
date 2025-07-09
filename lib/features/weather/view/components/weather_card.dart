import 'package:flutter/material.dart';
import 'package:weather_task/core/styles/app_colors.dart';
import 'package:weather_task/core/values/values.dart';
import 'package:weather_task/core/widgets/custom_image_view.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Values.baseAppRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              weather.location.name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            CustomImageView(
              imagePath:
                  weather.current.condition.localIconPath ??
                  weather.current.condition.icon,
              width: 64,
              height: 64,
            ),
            Text(
              '${weather.current.temp_c}°C',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            Text(
              weather.current.condition.text,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
