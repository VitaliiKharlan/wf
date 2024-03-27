import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherForecastDetails {
  WeatherForecastDetails({
    required this.coord,
    required this.main,
  });

  final Coord coord;
  final Main main;

  factory WeatherForecastDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastDetailsToJson(this);

  @override
  String toString() {
    return 'WeatherForecastDetails{coord: $coord, main: $main}';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Coord {
  final double lon;
  final double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);

  @override
  String toString() {
    return 'Coord{lon: $lon, lat: $lat}';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Main {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  String toString() {
    return 'Main{temp: $temp, feels_like: $feels_like, temp_min: $temp_min, temp_max: $temp_max, pressure: $pressure, humidity: $humidity}';
  }
}

//
// {
// "coord": {
// "lon": 30.5236,
// "lat": 50.45
// },
// "weather": [
// {
// "id": 804,
// "main": "Clouds",
// "description": "overcast clouds",
// "icon": "04n"
// }
// ],
// "base": "stations",
// "main": {
// "temp": 5.96,
// "feels_like": 5.96,
// "temp_min": 4.04,
// "temp_max": 7.93,
// "pressure": 1002,
// "humidity": 84
// },
// "visibility": 10000,
// "wind": {
// "speed": 0.89,
// "deg": 257,
// "gust": 2.68
// },
// "clouds": {
// "all": 100
// },
// "dt": 1711297198,
// "sys": {
// "type": 2,
// "id": 2003742,
// "country": "UA",
// "sunrise": 1711252276,
// "sunset": 1711297008
// },
// "timezone": 7200,
// "id": 696050,
// "name": "Pushcha-Vodytsya",
// "cod": 200
// }
