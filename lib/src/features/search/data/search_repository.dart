import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:breeze/env/env.dart';
import 'package:breeze/src/features/weather/model/daily_weather_model.dart';
import 'package:breeze/src/features/weather/model/weather_model.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  final dio = Dio();
  Future<WeatherModel> getSearchWeather(String searchTerm) async {
    try {
      final response = await dio.get(
          'https://api.weatherbit.io/v2.0/current?city=$searchTerm&key=${Env.apiKey}');

      return WeatherModel.fromJson(response.data);
    } catch (e) {
      log('Error: $e');
      throw Exception(e.toString());
    }
  }

  Future<DailyWeatherModel> getDailySearchForecast(String searchTerm) async {
    try {
      final response = await dio.get(
          'https://api.weatherbit.io/v2.0/forecast/daily',
          queryParameters: {
            'city': searchTerm,
            'key': Env.apiKey,
            'hours': '24'
          });

      if (response.statusCode == 200) {
        return DailyWeatherModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception(e.toString());
    }
  }
}


final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository();
});

final searchTempProvider = FutureProvider.family<WeatherModel, String>((ref, searchTerm) async {
  final data = ref.read(searchRepositoryProvider);
  return data.getSearchWeather(searchTerm);
});

final searchDailyForecastProvider = FutureProvider.family<DailyWeatherModel, String>((ref, searchTerm) async {
  final data = ref.read(searchRepositoryProvider);
  return data.getDailySearchForecast(searchTerm);
});