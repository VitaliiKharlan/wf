import 'package:dio/dio.dart';
import 'models/city_coordinate.dart';

const _host = 'http://api.openweathermap.org/geo/1.0/direct?';
const _cityName = 'q=Kyiv,804&limit=1';
const _appID = '&appid=';
const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';

const url = '$_host$_cityName$_appID$_apiKey';

class WeatherForecastCityCoordinateRepository {
  Future<List<CityCoordinate>> getCityCoordinate() async {
    final response = await Dio().get(url);

    final data = response.data as List<dynamic>;
    final cityCoordinateList = data
        .map((dynamic e) => CityCoordinate.fromJson(e as Map<String, dynamic>))
        .toList();
    // print(cityCoordinateList);

    return cityCoordinateList;
  }
}
