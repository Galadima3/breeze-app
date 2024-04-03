
// WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));
// String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    final int count;
    final List<Datum> data;

    WeatherModel({
        required this.count,
        required this.data,
    });

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final double appTemp;
    final int aqi;
    final String cityName;
    final int clouds;
    final String countryCode;
    final String datetime;
    final double dewpt;
    final double dhi;
    final double dni;
    final double elevAngle;
    final double ghi;
    final double gust;
    final int hAngle;
    final double lat;
    final double lon;
    final String obTime;
    final String pod;
    final int precip;
    final double pres;
    final int rh;
    final double slp;
    final int snow;
    final double solarRad;
    final List<String> sources;
    final String stateCode;
    final String station;
    final String sunrise;
    final String sunset;
    final num temp;
    final String timezone;
    final int ts;
    final double uv;
    final int vis;
    final Weather weather;
    final String windCdir;
    final String windCdirFull;
    final int windDir;
    final double windSpd;

    Datum({
        required this.appTemp,
        required this.aqi,
        required this.cityName,
        required this.clouds,
        required this.countryCode,
        required this.datetime,
        required this.dewpt,
        required this.dhi,
        required this.dni,
        required this.elevAngle,
        required this.ghi,
        required this.gust,
        required this.hAngle,
        required this.lat,
        required this.lon,
        required this.obTime,
        required this.pod,
        required this.precip,
        required this.pres,
        required this.rh,
        required this.slp,
        required this.snow,
        required this.solarRad,
        required this.sources,
        required this.stateCode,
        required this.station,
        required this.sunrise,
        required this.sunset,
        required this.temp,
        required this.timezone,
        required this.ts,
        required this.uv,
        required this.vis,
        required this.weather,
        required this.windCdir,
        required this.windCdirFull,
        required this.windDir,
        required this.windSpd,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        appTemp: json["app_temp"]?.toDouble(),
        aqi: json["aqi"],
        cityName: json["city_name"],
        clouds: json["clouds"],
        countryCode: json["country_code"],
        datetime: json["datetime"],
        dewpt: json["dewpt"]?.toDouble(),
        dhi: json["dhi"]?.toDouble(),
        dni: json["dni"]?.toDouble(),
        elevAngle: json["elev_angle"]?.toDouble(),
        ghi: json["ghi"]?.toDouble(),
        gust: json["gust"]?.toDouble(),
        hAngle: json["h_angle"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        obTime: json["ob_time"],
        pod: json["pod"],
        precip: json["precip"],
        pres: json["pres"]?.toDouble(),
        rh: json["rh"],
        slp: json["slp"]?.toDouble(),
        snow: json["snow"],
        solarRad: json["solar_rad"]?.toDouble(),
        sources: List<String>.from(json["sources"].map((x) => x)),
        stateCode: json["state_code"],
        station: json["station"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"],
        timezone: json["timezone"],
        ts: json["ts"],
        uv: json["uv"]?.toDouble(),
        vis: json["vis"],
        weather: Weather.fromJson(json["weather"]),
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windDir: json["wind_dir"],
        windSpd: json["wind_spd"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "app_temp": appTemp,
        "aqi": aqi,
        "city_name": cityName,
        "clouds": clouds,
        "country_code": countryCode,
        "datetime": datetime,
        "dewpt": dewpt,
        "dhi": dhi,
        "dni": dni,
        "elev_angle": elevAngle,
        "ghi": ghi,
        "gust": gust,
        "h_angle": hAngle,
        "lat": lat,
        "lon": lon,
        "ob_time": obTime,
        "pod": pod,
        "precip": precip,
        "pres": pres,
        "rh": rh,
        "slp": slp,
        "snow": snow,
        "solar_rad": solarRad,
        "sources": List<dynamic>.from(sources.map((x) => x)),
        "state_code": stateCode,
        "station": station,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "timezone": timezone,
        "ts": ts,
        "uv": uv,
        "vis": vis,
        "weather": weather.toJson(),
        "wind_cdir": windCdir,
        "wind_cdir_full": windCdirFull,
        "wind_dir": windDir,
        "wind_spd": windSpd,
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
