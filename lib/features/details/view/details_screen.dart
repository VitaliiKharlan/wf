import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/app_text_style.dart';
import '../../../repositories/weather_details/models/weather_forecast_details.dart';
import '../widgets/air_quality_details_widget.dart';
import '../widgets/hourly_weekly_details.dart';
import '../widgets/main_details_widget.dart';
import '../widgets/parameters_details_widget.dart';

class DetailsScreen extends StatefulWidget {
  final WeatherForecastDetails weatherForecastDetails;

  const DetailsScreen({
    super.key,
    required this.weatherForecastDetails,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // List<WeatherForecastDetails>? weatherForecastDetails;

  // List<CityCoordinate>? cities = [];

  @override
  Widget build(BuildContext context) {
    final model = widget.weatherForecastDetails;
    final country = model.sys.country.toString();

    final timeFormatter = DateFormat('jm');

    final offset = model.timezone;

    final sunriseTime = model.sys.sunrise;
    final sunriseTimeToMilliseconds = (sunriseTime + offset) * 1000;
    DateTime dateTimeSunriseTime =
        DateTime.fromMillisecondsSinceEpoch(sunriseTimeToMilliseconds);
    final outputSunriseTime = timeFormatter.format(dateTimeSunriseTime);

    final sunsetTime = model.sys.sunset;
    final sunsetTimeToMilliseconds = (sunsetTime + offset) * 1000;
    DateTime dateTimeSunsetTime =
        DateTime.fromMillisecondsSinceEpoch(sunsetTimeToMilliseconds);
    final outputSunsetTime = timeFormatter.format(dateTimeSunsetTime);

    return Scaffold(
      backgroundColor: const Color(0xFF2E335A),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 8),
          Center(
            child: Text(
              country,
              style: AppTextStyle.defaultRegularLargeTitle
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          MainDetailsWidget(
            weatherForecastDetails: widget.weatherForecastDetails,
          ),
          const SizedBox(height: 24),
          HourlyWeeklyDetailsWidget(
            weatherForecastDetails: widget.weatherForecastDetails,
          ),
          const SizedBox(height: 8),
          const AirQualityDetailsWidget(),
          const SizedBox(height: 12),
          ParametersDetailsWidget(
            weatherForecastDetails: widget.weatherForecastDetails,
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              outputSunriseTime,
              style: AppTextStyle.defaultRegularLargeTitle
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              outputSunsetTime,
              style: AppTextStyle.defaultRegularLargeTitle
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
