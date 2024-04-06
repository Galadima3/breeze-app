import 'package:breeze/src/features/weather/data/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                                        height: 35),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    //Date
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        DateTime.parse(rexar.datetime
                                                .toIso8601String())
                                            .dayOfWeek,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    //Condition
                                    Text(
                                      rexar.weather.description,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    )
                                  ],
                                ),
                                Center(
                                    child: Text(
                                  "${rexar.lowTemp.toStringAsFixed(0)}°/${rexar.highTemp.toStringAsFixed(0)}°",
                                  style: TextStyle(
                                      fontSize: 16.5.sp,
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
          error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ));
    });
  }
}

extension GetDayOfWeek on DateTime {
  String get dayOfWeek {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon.';
      case DateTime.tuesday:
        return 'Tues.';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thur.'; // Matches your requirement
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Sat.';
      case DateTime.sunday:
        return 'Sun.';
      default:
        return 'Unknown';
    }
  }
}

extension FirstWordEllipsisExtension on String {
  String get firstWordWithEllipsis {
    final words = split(' ');

    if (words.length > 3) {
      return '${words[0]} ${words[1]} ${words[2]}...';
    } else {
       return '${words[0]} ${words[1]}';
      //return words.isNotEmpty ? words[0]  : '';
    }
  }

}
