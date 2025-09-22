// To parse this JSON data, do
//
//     final hourlyWeatherModel = hourlyWeatherModelFromJson(jsonString);
import 'dart:convert';

HourlyWeatherModel hourlyWeatherModelFromJson(String str) =>
    HourlyWeatherModel.fromJson(json.decode(str));

String hourlyWeatherModelToJson(HourlyWeatherModel data) =>
    json.encode(data.toJson());

class HourlyWeatherModel {
  final String cityName;
  final String countryCode;
  final List<Datum> data;

  final String timezone;

  HourlyWeatherModel({
    required this.cityName,
    required this.countryCode,
    required this.data,
    required this.timezone,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) =>
      HourlyWeatherModel(
        cityName: json["city_name"],
        countryCode: json["country_code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "city_name": cityName,
        "country_code": countryCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "timezone": timezone,
      };
}

class Datum {
  final double temp;
  final DateTime timestampLocal;
  final DateTime timestampUtc;

  final Weather weather;

  Datum({
    required this.temp,
    required this.timestampLocal,
    required this.timestampUtc,
    required this.weather,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        temp: json["temp"]?.toDouble(),
        timestampLocal: DateTime.parse(json["timestamp_local"]),
        timestampUtc: DateTime.parse(json["timestamp_utc"]),
        weather: Weather.fromJson(json["weather"]),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "timestamp_local": timestampLocal.toIso8601String(),
        "timestamp_utc": timestampUtc.toIso8601String(),
        "weather": weather.toJson(),
      };
}


class Weather {
    final String description;
    final int code;
    final String icon;

    Weather({
        required this.description,
        required this.code,
        required this.icon,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json["description"],
        code: json["code"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "code": code,
        "icon": icon,
    };
}
// class Weather {
//   final Description description;
//   final int code;
//   final Icon icon;

//   Weather({
//     required this.description,
//     required this.code,
//     required this.icon,
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         description: descriptionValues.map[json["description"]]!,
//         code: json["code"],
//         icon: iconValues.map[json["icon"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "description": descriptionValues.reverse[description],
//         "code": code,
//         "icon": iconValues.reverse[icon],
//       };
// }

// enum Description { BROKEN_CLOUDS, FEW_CLOUDS, SCATTERED_CLOUDS }

// final descriptionValues = EnumValues({
//   "Broken clouds": Description.BROKEN_CLOUDS,
//   "Few clouds": Description.FEW_CLOUDS,
//   "Scattered clouds": Description.SCATTERED_CLOUDS
// });

// enum Icon { C02_D, C02_N, C03_D }

// final iconValues =
//     EnumValues({"c02d": Icon.C02_D, "c02n": Icon.C02_N, "c03d": Icon.C03_D});

// enum WindCdir { SW, W, WSW }

// final windCdirValues =
//     EnumValues({"SW": WindCdir.SW, "W": WindCdir.W, "WSW": WindCdir.WSW});

// enum WindCdirFull { SOUTHWEST, WEST, WEST_SOUTHWEST }

// final windCdirFullValues = EnumValues({
//   "southwest": WindCdirFull.SOUTHWEST,
//   "west": WindCdirFull.WEST,
//   "west-southwest": WindCdirFull.WEST_SOUTHWEST
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
