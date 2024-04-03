
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
    final geo = await GeolocationRepository().getCurrentLocation();
    final response = await dio.get(
        'https://api.weatherbit.io/v2.0/current?lat=${geo.latitude}&lon=${geo.longitude}&key=${Env.myApiKey}');
    log(response.data.toString());

    var rex = response.data;
    return WeatherModel.fromJson(rex);
    // log(rex.map((weather) => WeatherModel.fromJson(weather)));
    // return rex.map((weather) => WeatherModel.fromJson(weather));
  }
}

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

final tempProvider = FutureProvider<WeatherModel>((ref) async {
  final data = ref.read(weatherRepositoryProvider);
  return data.getCoordinateWeather();
});
