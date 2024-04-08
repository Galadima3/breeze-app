import 'package:breeze/src/features/search/data/search_repository.dart';
import 'package:breeze/src/features/search/presentation/widgets/search_forecast_tile.dart';
import 'package:breeze/src/features/weather/presentation/screens/custom_screen.dart';
import 'package:breeze/src/features/weather/presentation/widgets/apparent_temp_tile.dart';
import 'package:breeze/src/features/weather/presentation/widgets/forecast_tile.dart';
import 'package:breeze/src/features/weather/presentation/widgets/main_weather_tile.dart';
import 'package:breeze/src/features/weather/presentation/widgets/weather_meta_tile.dart';
import 'package:breeze/src/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchHomeScreen extends ConsumerWidget {
  final String searchTerm;
  const SearchHomeScreen({super.key, required this.searchTerm});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    final tempData = ref.watch(searchTempProvider(searchTerm));

    return tempData.when(
      data: (data) {
        final essex = data.data[0];

        final cleanDate = data.data[0].datetime.removeTime();
        final dateTime = DateTime.parse(cleanDate);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(
              essex.cityName,
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () => context.pushReplacementNamed(RoutePaths.homeScreenRoute), icon: const Icon(Icons.home))
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
                      child: SearchForecastTile(
                        searchTerm: searchTerm,
                      ))
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
