// To parse this JSON data, do
//
//     final dailyWeatherModel = dailyWeatherModelFromJson(jsonString);
import 'dart:convert';
DailyWeatherModel dailyWeatherModelFromJson(String str) => DailyWeatherModel.fromJson(json.decode(str));

class DailyWeatherModel {
    final String cityName;
    final String countryCode;
    final List<Datum> data;
    final double lat;
    final double lon;
    final String stateCode;
    final String timezone;

    DailyWeatherModel({
        required this.cityName,
        required this.countryCode,
        required this.data,
        required this.lat,
        required this.lon,
        required this.stateCode,
        required this.timezone,
    });

    factory DailyWeatherModel.fromJson(Map<String, dynamic> json) => DailyWeatherModel(
        cityName: json["city_name"],
        countryCode: json["country_code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        stateCode: json["state_code"],
        timezone: json["timezone"],
    );

    
}

class Datum {
    final double appMaxTemp;
    final double appMinTemp;
    final int clouds;
    final int cloudsHi;
    final int cloudsLow;
    final int cloudsMid;
    final DateTime datetime;
    final double dewpt;
    final double highTemp;
    final double lowTemp;
    
    final double maxTemp;
    final double minTemp;
    final double moonPhase;
    final double moonPhaseLunation;
    final int moonriseTs;
    final int moonsetTs;
    final double ozone;
    final int pop;
    final double precip;
    final double pres;
    final int rh;
    final double slp;
    final int snow;
    final int snowDepth;
    final int sunriseTs;
    final int sunsetTs;
    final double temp;
    final int ts;
    final double uv;
    final DateTime validDate;
    final double vis;
    final Weather weather;
    final String windCdir;
    final String windCdirFull;
    final int windDir;
    final double windGustSpd;
    final double windSpd;

    Datum({
        required this.appMaxTemp,
        required this.appMinTemp,
        required this.clouds,
        required this.cloudsHi,
        required this.cloudsLow,
        required this.cloudsMid,
        required this.datetime,
        required this.dewpt,
        required this.highTemp,
        required this.lowTemp,
       
        required this.maxTemp,
        required this.minTemp,
        required this.moonPhase,
        required this.moonPhaseLunation,
        required this.moonriseTs,
        required this.moonsetTs,
        required this.ozone,
        required this.pop,
        required this.precip,
        required this.pres,
        required this.rh,
        required this.slp,
        required this.snow,
        required this.snowDepth,
        required this.sunriseTs,
        required this.sunsetTs,
        required this.temp,
        required this.ts,
        required this.uv,
        required this.validDate,
        required this.vis,
        required this.weather,
        required this.windCdir,
        required this.windCdirFull,
        required this.windDir,
        required this.windGustSpd,
        required this.windSpd,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        appMaxTemp: json["app_max_temp"]?.toDouble(),
        appMinTemp: json["app_min_temp"]?.toDouble(),
        clouds: json["clouds"],
        cloudsHi: json["clouds_hi"],
        cloudsLow: json["clouds_low"],
        cloudsMid: json["clouds_mid"],
        datetime: DateTime.parse(json["datetime"]),
        dewpt: json["dewpt"]?.toDouble(),
        highTemp: json["high_temp"]?.toDouble(),
        lowTemp: json["low_temp"]?.toDouble(),
       
        maxTemp: json["max_temp"]?.toDouble(),
        minTemp: json["min_temp"]?.toDouble(),
        moonPhase: json["moon_phase"]?.toDouble(),
        moonPhaseLunation: json["moon_phase_lunation"]?.toDouble(),
        moonriseTs: json["moonrise_ts"],
        moonsetTs: json["moonset_ts"],
        ozone: json["ozone"]?.toDouble(),
        pop: json["pop"],
        precip: json["precip"]?.toDouble(),
        pres: json["pres"]?.toDouble(),
        rh: json["rh"],
        slp: json["slp"]?.toDouble(),
        snow: json["snow"],
        snowDepth: json["snow_depth"],
        sunriseTs: json["sunrise_ts"],
        sunsetTs: json["sunset_ts"],
        temp: json["temp"]?.toDouble(),
        ts: json["ts"],
        uv: json["uv"]?.toDouble(),
        validDate: DateTime.parse(json["valid_date"]),
        vis: json["vis"]?.toDouble(),
        weather: Weather.fromJson(json["weather"]),
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windDir: json["wind_dir"],
        windGustSpd: json["wind_gust_spd"]?.toDouble(),
        windSpd: json["wind_spd"]?.toDouble(),
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