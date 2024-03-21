import 'package:dio/dio.dart';
import 'models/city_coordinate.dart';

const _host = 'http://api.openweathermap.org/geo/1.0/direct?';
const _cityName = 'q=Kyiv,804&limit=1';
const _appID = '&appid=';
const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';

const url = '$_host$_cityName$_appID$_apiKey';

class WeatherForecastRepository {
  Future<List<CityCoordinate>> getCityCoordinate() async {
    final response = await Dio().get(url);

    final data = response.data as List<dynamic>;
    final cityCoordinateList = data
        .map((dynamic e) => CityCoordinate.fromJson(e as Map<String, dynamic>))
        .toList();
    print(cityCoordinateList);
    return cityCoordinateList;
  }
}

// final dio = Dio();
//
// class ApiClient {
//   static const _host = 'http://api.openweathermap.org/geo/1.0/direct?';
//   static const _cityName = 'q=Kyiv,804&limit=1';
//   static const _appID = '&appid=';
//   static const _apiKey = '4dbe24134496b55a1b13855ddf7c5847';
//
//   final uri = Uri.parse('$_host$_cityName$_appID$_apiKey');
//
//   Future<List<WF>> getNews() async {
//     final json = await Dio('uri')
//     as List<dynamic>;
//
//     final newsRequest = json
//         .map((dynamic e) => WF.fromJson(e as Map<String, dynamic>))
//         .toList();
//
//     return newsRequest;

//
//
//
// Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
//   final uri = Uri.parse('$_host$_cityName$_appID$_apiKey');
//   if (parameters != null) {
//     return uri.replace(queryParameters: parameters);
//   } else {
//     return uri;
//   }

// }

//   Future<List<WeatherForecastCityChoice>> getCityGeolocation() async {
//     final json = await helperGet('https://lightyear.ee/api/v1/instrument')
//     as List<dynamic>;
//
//     final newsRequest = json
//         .map((dynamic e) => WeatherForecastCityChoice.fromJson(e as Map<String, dynamic>))
//         .toList();
//
//     return newsRequest;
//   }
//
//   Future<dynamic> helperGet(String httpRequest) async {
//     final url = Uri.parse(httpRequest);
//     final request = await _client.getUrl(url);
//     final response = await request.close();
//
//     final jsonStrings = await response.transform(utf8.decoder).toList();
//     final jsonString = jsonStrings.join();
//     final dynamic json = jsonDecode(jsonString);
//
//     return json;
//   }
// }
//
//
//
// class WeatherForecastRepository implements WeatherDetailsRepository {
//   WeatherForecastRepository({
//     required this.dio,
//
//   });
//
//   final Dio dio;
//
//   @override
//   Future<List<dynamic>> getWeatherDetail() {
//    throw UnimplementedError();
//   }
//
//
//
// }
