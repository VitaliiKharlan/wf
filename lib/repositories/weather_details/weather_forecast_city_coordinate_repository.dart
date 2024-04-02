import 'package:dio/dio.dart';
import 'models/city_coordinate.dart';

const _host = 'http://api.openweathermap.org/geo/1.0/direct?';
const enterCityName = 'Lviv';
const _cityName = 'q=$enterCityName,804&limit=1';
const _appID = '&appid=';
const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';

class WeatherForecastCityCoordinateRepository {
  Future<CityCoordinate> getCityCoordinate2(String enterCityName) async {
    final url = '${_host}q=$enterCityName,804&limit=1$_appID$_apiKey';

    final response = await Dio().get(url);

    final data = response.data as List<dynamic>;
    final cityCoordinateList = data
        .map((dynamic e) => CityCoordinate.fromJson(e as Map<String, dynamic>))
        .toList();

    return cityCoordinateList.first;
  }
}
