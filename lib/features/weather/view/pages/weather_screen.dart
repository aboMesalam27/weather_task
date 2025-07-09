import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/core/utils/responsive_util.dart';
import 'package:weather_task/core/widgets/custom_button.dart';
import 'package:weather_task/core/widgets/custom_text_form_filed.dart';
import 'package:weather_task/features/weather/view/components/weather_card.dart';
import '../providers/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(
            fontSize: ResponsiveUtils.responsiveFontSize(
              context,
              mobile: 20,
              tablet: 24,
              desktop: 28,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: ResponsiveUtils.responsivePadding(context),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormFiled(
                        textFormFieldLabel: 'City Name',
                        controller: controller,
                        hintText: 'Enter City Name',
                      ),
                      SizedBox(height: ResponsiveUtils.responsiveHeight(context, 0.02)),
                      CustomButton(
                        onTap: () => provider.fetchWeather(controller.text),
                        text: "Search",
                      ),
                      SizedBox(height: ResponsiveUtils.responsiveHeight(context, 0.03)),
                      if (provider.loading)
                        const Center(child: CircularProgressIndicator())
                      else if (provider.weather != null)
                        WeatherCard(weather: provider.weather!),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}