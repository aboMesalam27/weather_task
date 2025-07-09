import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/core/widgets/custom_button.dart';
import 'package:weather_task/core/widgets/custom_text_form_filed.dart';
import 'package:weather_task/features/weather/view/components/weather_card.dart';

import '../providers/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFiled(
              textFormFieldLabel: 'City Name',
              controller: controller,
              hintText: 'Enter City Name',
            ),
            const SizedBox(height: 10),
            CustomButton(
              onTap: () => provider.fetchWeather(controller.text),
              text: "Search",
            ),

            const SizedBox(height: 20),
            if (provider.loading)
              const Center(child: CircularProgressIndicator())
            else if (provider.weather != null)
              WeatherCard(weather: provider.weather!),
          ],
        ),
      ),
    );
  }
}
