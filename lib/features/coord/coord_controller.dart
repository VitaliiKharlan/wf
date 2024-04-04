import 'package:flutter/material.dart';

import '../../repositories/weather_details/models/weather_forecast_details.dart';
import '../../repositories/weather_details/weather_forecast_details_repository.dart';

class LatLon {
  final double lat;
  final double lon;

  LatLon({
    required this.lat,
    required this.lon,
  });
}

class CoordController extends ChangeNotifier {
  final List<LatLon> cities = [
    LatLon(lat: 50.4500336, lon: 30.5241361),
    LatLon(lat: 49.841952, lon: 24.0315921),
    LatLon(lat: 46.4843023, lon: 30.7322878),
  ];

  final List<WeatherForecastDetails> details = [];


  Future<void> init() async {
    final repository = WeatherForecastDetailsRepository();
    for (final city in cities) {
      final coordsLatLon =
          await repository.getWeatherForecastDetails(city.lat, city.lon);
      details.add(coordsLatLon);
    }
    notifyListeners();
  }
}
