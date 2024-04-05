// ignore_for_file: deprecated_member_use
import 'package:breeze/src/features/weather/data/weather_repository.dart';
import 'package:breeze/src/features/weather/presentation/screens/custom_screen.dart';
import 'package:breeze/src/features/weather/presentation/widgets/apparent_temp_tile.dart';
import 'package:breeze/src/features/weather/presentation/widgets/main_weather_tile.dart';
import 'package:breeze/src/features/weather/presentation/widgets/weather_meta_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    final tempData = ref.watch(tempProvider);

    return tempData.when(
      data: (data) {
        final essex = data.data[0];

        final cleanDate = data.data[0].datetime.removeTime();
        final dateTime = DateTime.parse(cleanDate);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Row(
              children: [
                const Icon(Icons.location_pin),
                Text(essex.cityName),
              ],
            ),
            actions: const [
              Icon(Icons.search),
              Icon(Icons.more_vert),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Main Weather Tile
                  MainWeatherTile(
                    dateTime: dateTime,
                    essex: essex,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(height: 9.5),
                  //Tile 2
                  ApparentTempTile(essex: essex),
                  const SizedBox(height: 9.5),
                  //Tile 3
                  Row(
                    children: [
                      WeatherMetaTile(
                        labelText: 'Wind Speed',
                        svgPath: 'assets/wind.svg',
                        mainData: '${essex.windSpd.toStringAsFixed(1)} Km/h',
                      ),
                      const SizedBox(width: 8.75),
                      WeatherMetaTile(
                        labelText: 'Humidity',
                        svgPath: 'assets/humidity.svg',
                        mainData: '${essex.rh.toStringAsFixed(1)}%',
                      ),
                    ],
                  ),
                  const SizedBox(height: 9.5),
                  //Forecast Tile
                  Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF2E2D2D),
                      ),
                      child: const ForecastTile())
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => CustomScreen(
          inputWidget: Text(
        'Error: ${error.toString()}',
        style: const TextStyle(color: Colors.black),
      )),
      loading: () => const CustomScreen(
          inputWidget: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      )),
    );
  }
}

class ForecastTile extends ConsumerWidget {
  const ForecastTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final forekast = ref.watch(dailyWeatherProvider);
      return forekast.when(
          data: (forecastData) {
            final forekast = forecastData.data;
            return Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF2E2D2D),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Daily forecast',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final rexar = forekast[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Row 1
                                Row(
                                  children: [
                                    //Icon
                                    Image.asset(
                                        'assets/icons/${rexar.weather.icon}.png',
                                        height: 40),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    //Date
                                    Text(
                                      DateTime.parse(
                                              rexar.datetime.toIso8601String())
                                          .dayOfWeek,
                                      style: const TextStyle(
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    //Condition
                                    Text(
                                      rexar.weather.description,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                                Center(
                                    child: Text(
                                  "${rexar.lowTemp.toStringAsFixed(0)}°/${rexar.highTemp.toStringAsFixed(0)}°",
                                  style: const TextStyle(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.white,
                            ),
                        itemCount: forekast.length),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) =>
              CustomScreen(inputWidget: Text(error.toString())),
          loading: () => const CustomScreen(
              inputWidget: CircularProgressIndicator.adaptive()));
    });
  }
}

extension GetDayOfWeek on DateTime {
  String get dayOfWeek {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday'; // Matches your requirement
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }
}
