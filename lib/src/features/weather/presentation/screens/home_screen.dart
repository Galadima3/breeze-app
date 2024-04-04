// ignore_for_file: deprecated_member_use
import 'package:breeze/src/features/weather/data/weather_repository.dart';
import 'package:breeze/src/features/weather/domain/chart_model.dart';
import 'package:fl_chart/fl_chart.dart';
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
                  SizedBox(
                    height: 245,
                    width: double.infinity,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final hourly = ref.watch(hourlyWeatherProvider);
                        return hourly.when(
                          data: (hourly) {
                            final dex = hourly.data
                                .map((e) => ChartModel(
                                    temp: e.temp.toStringAsExponential(1),
                                    icon: e.weather.icon,
                                    timeStamp:
                                        e.timestampLocal.toIso8601String()))
                                .toList();
                            return ChartWidget(
                              hourlyData: dex,
                            );
                          },
                          error: (error, stackTrace) => CustomScreen(
                              inputWidget: Text(
                            error.toString(),
                            style: const TextStyle(color: Colors.black),
                          )),
                          loading: () => const CustomScreen(
                              inputWidget:
                                  CircularProgressIndicator.adaptive()),
                        );
                      },
                    ),
                  ),
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

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.hourlyData});

  final List<ChartModel> hourlyData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 245,
        width:400 ,
        decoration: BoxDecoration(
            color: const Color(0xFF2E2D2D),
            borderRadius: BorderRadius.circular(20),
          ),
        child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: hourlyData
                      .map((point) => FlSpot(
                          _parseHourToDouble(point.formattedHour),
                          point.temp.doubler()))
                      .toList(),
                  isCurved: false,
                  dotData: const FlDotData(
                    show: true,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

extension Rexar on String {
  double doubler() {
    return double.parse(this);
  }
}

double _parseHourToDouble(String formattedHour) {
  final splitHour = formattedHour.split(':');
  final hour = int.parse(splitHour[0]);
  return hour.toDouble(); // Convert to double for FlSpot
}
