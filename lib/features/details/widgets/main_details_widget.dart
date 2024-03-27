import 'package:flutter/material.dart';
import '../../../repositories/weather_details/models/weather_forecast_details.dart';
import '../../theme/app_text_style.dart';

class MainDetailsWidget extends StatelessWidget {
  final WeatherForecastDetails? weatherForecastDetails;

  const MainDetailsWidget({
    super.key,
    this.weatherForecastDetails,
  });

  @override
  Widget build(BuildContext context) {
    final cityName = weatherForecastDetails?.name.toString();

    final temp = weatherForecastDetails?.main.temp;
    final tempRound = temp?.toStringAsFixed(0).toString();

    final main = weatherForecastDetails?.weather.first.main.toString();
    final description =
        weatherForecastDetails?.weather.first.description.toString();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$cityName',
            // 'Montreal',
            style: AppTextStyle.defaultRegularLargeTitle
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$tempRound\u00B0',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white24),
                maxLines: 1,
              ),

              // Text(
              //   '19\u00B0',
              //   style: AppTextStyle.defaultSemiBoldTitle3
              //       .copyWith(color: Colors.white),
              // ),
              Text(
                ' | ',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white24),
              ),
              Text(
                '$main, ',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white24),
              ),
              Text(
                '$description',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
