import 'package:dio/dio.dart';
import 'models/weather_forecast_details.dart';

const _host = 'https://api.openweathermap.org/data/2.5/weather?';
const _units = 'units=metric&';
const _appID = 'appid=';
const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';

const _latKyiv = 'lat=50.4500336&';
const _lonKyiv = 'lon=30.5241361&';
const urlKyiv = '$_host$_latKyiv$_lonKyiv$_units$_appID$_apiKey';

const _latLviv = 'lat=49.841952&';
const _lonLviv = 'lon=24.0315921&';
const urlLviv = '$_host$_latLviv$_lonLviv$_units$_appID$_apiKey';

class WeatherForecastDetailsRepository {
  Future<WeatherForecastDetails> getWeatherForecastDetailsKyiv() async {
    final response = await Dio().get(urlKyiv);

    final data = response.data as Map<String, dynamic>;

    final weatherForecastDetailsList = WeatherForecastDetails.fromJson(data);

    return weatherForecastDetailsList;
  }

  Future<WeatherForecastDetails> getWeatherForecastDetailsLviv() async {
    final response = await Dio().get(urlLviv);

    final data = response.data as Map<String, dynamic>;

    final weatherForecastDetailsList = WeatherForecastDetails.fromJson(data);

    return weatherForecastDetailsList;
  }
}
