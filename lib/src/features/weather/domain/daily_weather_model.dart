// To parse this JSON data, do
//
//     final dailyWeatherModel = dailyWeatherModelFromJson(jsonString);
import 'dart:convert';

DailyWeatherModel dailyWeatherModelFromJson(String str) =>
    DailyWeatherModel.fromJson(json.decode(str));

class DailyWeatherModel {
  final String cityName;
  final String countryCode;
  final List<Datum> data;

  final String stateCode;
  final String timezone;

  DailyWeatherModel({
    required this.cityName,
    required this.countryCode,
    required this.data,
    required this.stateCode,
    required this.timezone,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) =>
      DailyWeatherModel(
        cityName: json["city_name"],
        countryCode: json["country_code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        stateCode: json["state_code"],
        timezone: json["timezone"],
      );
}

class Datum {
  final int clouds;
  final int cloudsHi;
  final int cloudsLow;
  final int cloudsMid;
  final DateTime datetime;
  final double highTemp;
  final double lowTemp;
  final int moonriseTs;
  final int moonsetTs;
  final int pop;
  final int rh;
  final int snow;
  final int snowDepth;
  final int sunriseTs;
  final int sunsetTs;
  final int ts;
  final DateTime validDate;
  final Weather weather;
  final String windCdir;
  final String windCdirFull;
  final int windDir;

  Datum({
    required this.clouds,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.datetime,
    required this.highTemp,
    required this.lowTemp,
    required this.moonriseTs,
    required this.moonsetTs,
    required this.pop,
    required this.rh,
    required this.snow,
    required this.snowDepth,
    required this.sunriseTs,
    required this.sunsetTs,
    required this.ts,
    required this.validDate,
    required this.weather,
    required this.windCdir,
    required this.windCdirFull,
    required this.windDir,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        clouds: json["clouds"],
        cloudsHi: json["clouds_hi"],
        cloudsLow: json["clouds_low"],
        cloudsMid: json["clouds_mid"],
        datetime: DateTime.parse(json["datetime"]),
        highTemp: json["high_temp"]?.toDouble(),
        lowTemp: json["low_temp"]?.toDouble(),
        moonriseTs: json["moonrise_ts"],
        moonsetTs: json["moonset_ts"],
        pop: json["pop"],
        rh: json["rh"],
        snow: json["snow"],
        snowDepth: json["snow_depth"],
        sunriseTs: json["sunrise_ts"],
        sunsetTs: json["sunset_ts"],
        ts: json["ts"],
        validDate: DateTime.parse(json["valid_date"]),
        weather: Weather.fromJson(json["weather"]),
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windDir: json["wind_dir"],
      );
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
