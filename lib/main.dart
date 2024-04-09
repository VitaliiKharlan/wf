import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import 'weather_forecast_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  dio.interceptors.add;

  // AirPollutionRepository().getAirPollutionDetails(50, 50);

  runApp(const WeatherForecastApp());
}
