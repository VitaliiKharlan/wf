import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/repositories/weather_details/models/city_coordinate.dart';
import 'package:weather_forecast/repositories/weather_details/weather_forecast_city_coordinate_repository.dart';

class CityController extends ChangeNotifier {
  final List<CityCoordinate> cities = [];
  final cityNames = ['Kyiv', 'Lviv', 'Odessa','Energodar'];

  Future<void> init() async {
    final repository = WeatherForecastCityCoordinateRepository();
    for (final cityName in cityNames) {
      final cords = await repository.getCityCoordinate2(cityName);
      cities.add(cords);
    }
    notifyListeners();
  }
}
