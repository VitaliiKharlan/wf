import 'package:flutter/material.dart';

import '../../../repositories/weather_details/city_coordinate_repository.dart';
import '../../../repositories/weather_details/models/city_coordinate.dart';



class CityController extends ChangeNotifier {
  final List<CityCoordinate> cities = [];
  final List<String> cityNames;

  CityController({required this.cityNames});

  Future<void> init() async {
    final repository = CityCoordinateRepository();
    for (final cityName in cityNames) {
      final coordinates = await repository.getCityCoordinate(cityName);
      cities.add(coordinates);
    }
    notifyListeners();
  }
}
