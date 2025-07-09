import 'package:flutter/material.dart';
import 'package:weather_task/core/styles/app_colors.dart';
import 'package:weather_task/core/utils/responsive_util.dart';
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
        padding: EdgeInsets.all(
          ResponsiveUtils.isMobile(context) ? 16 : 24,
        ),
        child: Column(
          children: [
            Text(
              weather.location.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontSize: ResponsiveUtils.responsiveFontSize(
                  context,
                  mobile: 20,
                  tablet: 24,
                  desktop: 28,
                ),
              ),
            ),
            SizedBox(height: ResponsiveUtils.responsiveHeight(context, 0.02)),
            CustomImageView(
              imagePath: weather.current.condition.localIconPath ??
                  weather.current.condition.icon,
              width: ResponsiveUtils.isMobile(context) ? 64 : 96,
              height: ResponsiveUtils.isMobile(context) ? 64 : 96,
            ),
            SizedBox(height: ResponsiveUtils.responsiveHeight(context, 0.01)),
            Text(
              '${weather.current.temp_c}°C',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontSize: ResponsiveUtils.responsiveFontSize(
                  context,
                  mobile: 24,
                  tablet: 32,
                  desktop: 40,
                ),
              ),
            ),
            SizedBox(height: ResponsiveUtils.responsiveHeight(context, 0.01)),
            Text(
              weather.current.condition.text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontSize: ResponsiveUtils.responsiveFontSize(
                  context,
                  mobile: 16,
                  tablet: 20,
                  desktop: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}