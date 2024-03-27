// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastDetails _$WeatherForecastDetailsFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastDetails(
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastDetailsToJson(
        WeatherForecastDetails instance) =>
    <String, dynamic>{
      'coord': instance.coord.toJson(),
      'main': instance.main.toJson(),
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      temp: (json['temp'] as num).toDouble(),
      feels_like: (json['feels_like'] as num).toDouble(),
      temp_min: (json['temp_min'] as num).toDouble(),
      temp_max: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
