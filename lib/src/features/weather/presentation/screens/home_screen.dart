// ignore_for_file: deprecated_member_use

import 'package:breeze/src/features/weather/data/weather_repository.dart';
import 'package:breeze/src/features/weather/domain/weather_model.dart';

import 'package:breeze/src/features/weather/presentation/screens/custom_screen.dart';
import 'package:breeze/src/features/weather/presentation/screens/widgets/apparent_temp_tile.dart';
import 'package:breeze/src/features/weather/presentation/screens/widgets/main_weather_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  MainWeatherTile(dateTime: dateTime, essex: essex),
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
                    height: 245,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E2D2D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) =>
          CustomScreen(inputWidget: Text('Error: ${error.toString()}')),
      loading: () => const CustomScreen(
          inputWidget: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      )),
    );
  }
}

class WeatherMetaTile extends StatelessWidget {
  const WeatherMetaTile({
    super.key,
    required this.svgPath,
    required this.labelText,
    required this.mainData,
  });

  final String svgPath;
  final String labelText;
  final String mainData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 190,
      decoration: BoxDecoration(
        color: const Color(0xFF2E2D2D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              labelText,
              style: const TextStyle(fontSize: 18.5),
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 37.5,
                  width: 37.5,
                  child: SvgPicture.asset(
                    svgPath,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 7.85,
                ),
                Text(
                  mainData,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
