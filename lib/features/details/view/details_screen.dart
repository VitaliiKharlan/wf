import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../theme/app_text_style.dart';
import '../../../repositories/weather_details/weather_forecast_details_repository.dart';
import '../../../repositories/weather_details/models/weather_forecast_details.dart';
import '../widgets/air_quality_details_widget.dart';
import '../widgets/hourly_weekly_details.dart';
import '../widgets/main_details_widget.dart';
import '../widgets/parameters_details_widget.dart';



class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  WeatherForecastDetails? _weatherForecastDetails;

  // List<CityCoordinate>? cities = [];

  @override
  void initState() {
    _loadWeatherForecastDetails();
    super.initState();
    // final cityController = CityController();
    // cityController.init();
    // cityController.addListener(() {
    //   setState(() {
    //     cities = cityController.cities;
    //   });
    // });
  }

  // @override
  // void initState() {
  //   // _loadWeatherForecastDetails();
  //   super.initState();
  //   final detailsController = CoordController();
  //   detailsController.init();
  //   detailsController.addListener(() {
  //     setState(() {
  //       _weatherForecastDetails = detailsController.details;
  //     });
  //   });
  // }

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

      return Scaffold(
        backgroundColor: const Color(0xFF2E335A),
        body: (_weatherForecastDetails == null)
            ? const Center(
          child: SizedBox(
              height: 80, width: 80, child: CircularProgressIndicator()),
        )
            : ListView(
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
            MainDetailsWidget(
                weatherForecastDetails: _weatherForecastDetails),
            const SizedBox(height: 24),
            HourlyWeeklyDetailsWidget(
                weatherForecastDetails: _weatherForecastDetails),
            const SizedBox(height: 8),
            const AirQualityDetailsWidget(),
            const SizedBox(height: 12),
            ParametersDetailsWidget(
                weatherForecastDetails: _weatherForecastDetails),
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
      _weatherForecastDetails = await WeatherForecastDetailsRepository()
          .getWeatherForecastDetails(50.4500336, 30.5241361);
      setState(() {});
    }
  }

