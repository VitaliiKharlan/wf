import 'package:flutter/material.dart';
import '../../repositories/weather_details/models/city_coordinate.dart';
import '../../repositories/weather_details/city_coordinate_repository.dart';

class CityController extends ChangeNotifier {
  final List<CityCoordinate> cities = [];
  final cityNames = ['Kyiv', 'Lviv', 'Odessa',];

  Future<void> init() async {
    final repository = CityCoordinateRepository();
    for (final cityName in cityNames) {
      final cords = await repository.getCityCoordinate(cityName);
      cities.add(cords);
    }
    notifyListeners();
  }
}

