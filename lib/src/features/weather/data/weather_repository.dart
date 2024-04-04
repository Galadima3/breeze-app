import 'dart:developer';
import 'package:breeze/env/env.dart';
import 'package:breeze/src/features/weather/data/geo_repository.dart';
import 'package:breeze/src/features/weather/domain/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherRepository {
  final dio = Dio();

  //get weather based on Geocoordinates
  Future<WeatherModel> getCoordinateWeather() async {
    try {
      final geo = await GeolocationRepository().getCurrentLocation();
      final response = await dio.get(
          'https://api.weatherbit.io/v2.0/current?lat=${geo.latitude}&lon=${geo.longitude}&key=${Env.myApiKey}');
      log(response.data.toString());
      return WeatherModel.fromJson(response.data);
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
  //print(data.getCoordinateWeather());
  return data.getCoordinateWeather();
});
