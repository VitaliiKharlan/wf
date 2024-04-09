import 'package:flutter/material.dart';
import 'package:weather_forecast/repositories/weather_details/air_pollution_repository.dart';
import 'package:weather_forecast/repositories/weather_details/models/air_pollution_details.dart';

class LatLon {
  final double lat;
  final double lon;

  LatLon({
    required this.lat,
    required this.lon,
  });
}

class AirPollutionController extends ChangeNotifier {
  final List<LatLon> cities = [
    LatLon(lat: 50.4500336, lon: 30.5241361),
    LatLon(lat: 49.841952, lon: 24.0315921),
    LatLon(lat: 46.4843023, lon: 30.7322878),
  ];

  final List<AirPollutionDetails> airPollutionDetails = [];

  Future<void> init() async {
    final repository = AirPollutionRepository();
    for (final city in cities) {
      final coordsLatLon =
          await repository.getAirPollutionDetails(city.lat, city.lon);
      airPollutionDetails.add(coordsLatLon);
    }
    notifyListeners();
  }
}
