import 'package:flutter/material.dart';
import 'package:weather_forecast/features/theme/app.images.dart';
import 'package:weather_forecast/features/theme/app_text_style.dart';

class HourlyWeeklyDetailsWidget extends StatelessWidget {
  const HourlyWeeklyDetailsWidget({super.key});

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
          const _HourlyForecastWidget(),
        ],
      ),
    );
  }
}

class _HourlyForecastWidget extends StatelessWidget {
  const _HourlyForecastWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 180,
        // width: 540,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 24,
          itemExtent: 72,
          itemBuilder: (BuildContext context, int index) {
            return const Image(
              image: AssetImage(AppImages.hourlyDetailsScreen),
            );
          },
        ),
      ),
    );
  }
}
