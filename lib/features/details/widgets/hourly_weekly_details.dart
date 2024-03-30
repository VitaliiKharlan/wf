import 'package:flutter/material.dart';
import 'package:weather_forecast/features/theme/app.images.dart';
import 'package:weather_forecast/features/theme/app_colors.dart';
import 'package:weather_forecast/features/theme/app_text_style.dart';
import 'package:weather_forecast/repositories/weather_details/models/weather_forecast_details.dart';

class HourlyWeeklyDetailsWidget extends StatelessWidget {
  final WeatherForecastDetails? weatherForecastDetails;

  const HourlyWeeklyDetailsWidget({
    super.key,
    required this.weatherForecastDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/separator_details_screen.png',
            width: 540.0,
            height: 4.0,
          ),
          Image.asset(
            'assets/images/shape_details_screen.png',
            width: 540.0,
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Hourly Forecast',
                  style: AppTextStyle.labelColorDarkSecondary
                      .copyWith(color: Colors.white54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  'Weekly Forecast',
                  style: AppTextStyle.labelColorDarkSecondary
                      .copyWith(color: Colors.white54),
                ),
              ),
            ],
          ),
          _HourlyForecastWidget(weatherForecastDetails: weatherForecastDetails),
        ],
      ),
    );
  }
}

class _HourlyForecastWidget extends StatelessWidget {
  final WeatherForecastDetails? weatherForecastDetails;

  const _HourlyForecastWidget({
    required this.weatherForecastDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 180,
        // width: 540,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 24,
          itemExtent: 72,
          itemBuilder: (BuildContext context, int index) {
            return _HourlyForecastItemWidget(
                weatherForecastDetails: weatherForecastDetails);
          },
        ),
      ),
    );
  }
}

class _HourlyForecastItemWidget extends StatelessWidget {
  final WeatherForecastDetails? weatherForecastDetails;

  const _HourlyForecastItemWidget({
    required this.weatherForecastDetails,
  });

  @override
  Widget build(BuildContext context) {
    final temp = weatherForecastDetails?.main.temp;
    final tempRound = temp?.toStringAsFixed(0).toString();

    final clouds = weatherForecastDetails?.clouds.all.toString();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.solidDarkHourlyButtonShort1.withOpacity(0.2),
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(4, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                '12 AM',
                style: AppTextStyle.defaultTextDarkRegular
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Image(
                image: AssetImage(AppImages.smallIconMoonCloudFastWind),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        '$clouds%',
                        style: AppTextStyle.defaultTextDarkRegular
                            .copyWith(color: Colors.white),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '$tempRound\u00B0',
                        style: AppTextStyle.defaultTextDarkRegular
                            .copyWith(color: Colors.white),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
