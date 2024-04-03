// import 'package:flutter/material.dart';
// import 'package:weather_forecast/repositories/weather_details/models/city_coordinate.dart';
// import 'package:weather_forecast/repositories/weather_details/city_coordinate_repository.dart';
// import 'package:weather_forecast/repositories/weather_details/models/weather_forecast_details.dart';
// import 'package:weather_forecast/repositories/weather_details/weather_forecast_details_repository.dart';
//
// class CoordController extends ChangeNotifier {
//   final List<WeatherForecastDetails> details = [];
//   final latCoords = [50.4500336, 49.841952, 46.4843023];
//   final lonCoords = [30.5241361, 24.0315921, 30.7322878];
//
//   Future<void> init() async {
//     final repository = WeatherForecastDetailsRepository();
//     for (final latCoord in latCoords) for(final lonCoord in lonCoords) {
//       final coordsLatLon = await repository.getWeatherForecastDetails(
//           latCoord, lonCoord);
//       details.add(coordsLatLon);
//     }
//     notifyListeners();
//   }
// }


