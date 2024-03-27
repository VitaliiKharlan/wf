import 'package:dio/dio.dart';
import 'models/weather_forecast_details.dart';

const _host = 'https://api.openweathermap.org/data/2.5/weather?';
const _lat = 'lat=50.4500336&';
const _lon = 'lon=30.5241361&';
const _units = 'units=metric&';
const _appID = 'appid=';
const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';

const url = '$_host$_lat$_lon$_units$_appID$_apiKey';

class WeatherForecastDetailsRepository {
  Future<WeatherForecastDetails> getWeatherForecastDetails() async {
    final response = await Dio().get(url);
    print(response);

    final data = response.data as Map<String, dynamic>;
    print(data);
    final weatherForecastDetailsList = WeatherForecastDetails.fromJson(data);
    print(weatherForecastDetailsList);

    return weatherForecastDetailsList;
  }
}
