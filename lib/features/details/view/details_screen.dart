import 'package:flutter/material.dart';
import 'package:weather_forecast/features/theme/app_text_style.dart';
import 'package:weather_forecast/repositories/weather_details/weather_forecast_details_repository.dart';
import '../../../repositories/weather_details/models/weather_forecast_details.dart';
import '../widgets/air_quality_details_widget.dart';
import '../widgets/hourly_weekly_details.dart';
import '../widgets/main_details_widget.dart';
import '../widgets/parameters_details_widget.dart';

import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  WeatherForecastDetails? _weatherForecastDetails;

  @override
  void initState() {
    _loadWeatherForecastDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = _weatherForecastDetails;
    final country = model?.sys.country.toString();

    final timeFormatter = DateFormat('jm');

    final offset = model?.timezone ?? 0;

    final sunriseTime = model?.sys.sunrise ?? 0;
    final sunriseTimeToMilliseconds = (sunriseTime + offset) * 1000;
    DateTime dateTimeSunriseTime =
        DateTime.fromMillisecondsSinceEpoch(sunriseTimeToMilliseconds);
    final outputSunriseTime = timeFormatter.format(dateTimeSunriseTime);

    final sunsetTime = model?.sys.sunset ?? 0;
    final sunsetTimeToMilliseconds = (sunsetTime + offset) * 1000;
    DateTime dateTimeSunsetTime =
        DateTime.fromMillisecondsSinceEpoch(sunsetTimeToMilliseconds);
    final outputSunsetTime = timeFormatter.format(dateTimeSunsetTime);

    // final sunriseTime = model?.sys.sunrise.toInt();
    // int sunriseTimeModel = model!.sys.sunrise.toInt();
    // int sunriseTime = sunriseTimeModel;
    // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(sunriseTime);
    // var inputFormat = DateTime.fromMillisecondsSinceEpoch(sunriseTime);
    // var outputFormat = DateFormat.d().add_MMMM().add_y().format(dateTime);

    return Scaffold(
      backgroundColor: const Color(0xFF2E335A),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 8),
          Center(
            child: Text(
              '$country',
              style: AppTextStyle.defaultRegularLargeTitle
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          MainDetailsWidget(weatherForecastDetails: _weatherForecastDetails),
          const SizedBox(height: 24),
          HourlyWeeklyDetailsWidget(
              weatherForecastDetails: _weatherForecastDetails),
          const SizedBox(height: 8),
          const AirQualityDetailsWidget(),
          const SizedBox(height: 12),
          ParametersDetailsWidget(weatherForecastDetails: _weatherForecastDetails),
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

  Future<void> _loadWeatherForecastDetails() async {
    _weatherForecastDetails =
        await WeatherForecastDetailsRepository().getWeatherForecastDetails();
    // print(_weatherForecastDetails);
    setState(() {});
  }
}

// const sunriseUnix = 1660903800;
// const sunsetUnix = 1660952880;
//
// function showSunTimes(sunriseUnix, sunsetUnix, timeZone) {
//   console.log(`Sunrise (${timeZone}):`, new Date(sunriseUnix * 1000).toLocaleString('default', { timeZone }));
//   console.log(`Sunset (${timeZone}):`, new Date(sunsetUnix * 1000).toLocaleString('default', { timeZone }));
// }
//
// showSunTimes(sunriseUnix, sunsetUnix, 'America/New_York');
// showSunTimes(sunriseUnix, sunsetUnix, 'UTC');
