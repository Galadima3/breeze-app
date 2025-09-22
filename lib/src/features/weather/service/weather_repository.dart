import 'dart:convert';
import 'dart:developer';
import 'package:breeze/env/env.dart';
import 'package:breeze/src/features/weather/service/geo_repository.dart';
import 'package:breeze/src/features/weather/model/daily_weather_model.dart';

import 'package:breeze/src/features/weather/model/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;



class WeatherRepository {
  final dio = Dio();

  //get weather based on Geocoordinates
  Future<WeatherModel> getCoordinateWeather() async {
    try {
      final geo = await GeolocationRepository().getCurrentLocation();
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${geo.latitude}&lon=${geo.longitude}&appid=${Env.apiKey}'
          //'https://api.weatherbit.io/v2.0/current?lat=${geo.latitude}&lon=${geo.longitude}&key=${Env.apiKey}');
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      log('Error: $e');
      throw Exception(e.toString());
    }
  }

  Future<DailyWeatherModel> getDailyForecast() async {
  try {
    final geo = await GeolocationRepository().getCurrentLocation();
    final url = Uri.parse(
        'https://api.weatherbit.io/v2.0/forecast/daily?lat=${geo.latitude}&lon=${geo.longitude}&key=${Env.apiKey}&hours=24');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //log(response.body.toString());
      return DailyWeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    log('Error: $e');
    throw Exception(e.toString());
  }
}
}

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

final tempProvider = FutureProvider<WeatherModel>((ref) async {
  final data = ref.read(weatherRepositoryProvider);
  return data.getCoordinateWeather();
});

final dailyWeatherProvider = FutureProvider<DailyWeatherModel>((ref) async {
  final data = ref.read(weatherRepositoryProvider);
  return data.getDailyForecast();
});
