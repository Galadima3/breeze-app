import 'package:breeze/src/features/weather/domain/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainWeatherTile extends StatelessWidget {
  const MainWeatherTile({
    super.key,
    required this.dateTime,
    required this.essex,
    required this.screenWidth,
  });

  final DateTime dateTime;
  final Datum essex;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: screenWidth < 400 ? 375 : double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2E2D2D),
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //XX
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //1
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateTime.formatAsTodayStyle(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w200),
                    ),
                    Text(
                      essex.weather.description,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    )
                  ],
                ),

                //2
                Text(
                  '${essex.temp.toStringAsFixed(0)}\u00B0C',
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                )
              ],
            ),
            //YY
            Image.asset(
              'assets/icons/${essex.weather.icon}.png',
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}

extension DateTimeFormatter on DateTime {
  String formatAsTodayStyle() {
    final formatter = DateFormat('EEEE, MMMM d');
    return formatter.format(this);
  }
}

extension RemoveTimeExtension on String {
  String removeTime() {
    return substring(0, lastIndexOf(':'));
  }
}
