class WeatherModel {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherModel(
      {required this.location, required this.current, required this.forecast});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]));
  }
}

class Location {
  final String name;
  final String country;
  final String localTime;

  Location(
      {required this.name, required this.country, required this.localTime});
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        name: json["name"],
        country: json["country"],
        localTime: json["localtime"] ?? "");
  }
}

class Current {
  final String lastUpdated;
  final num temp;
  final num isDay;
  final Condition condition;
  final AirQuality airQuality;
  final num uv;
  final num windKph;
  final String windDir;
  final num humidity;
  final num feelsLike;
  final num dewPoint;
  final num visKm;

  Current(
      {required this.lastUpdated,
      required this.temp,
      required this.isDay,
      required this.condition,
      required this.airQuality,
      required this.uv,
      required this.windKph,
      required this.windDir,
      required this.humidity,
      required this.feelsLike,
      required this.dewPoint,
      required this.visKm});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
        lastUpdated: json["last_updated"],
        temp: json["temp_c"],
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        airQuality: AirQuality.fromJson(json["air_quality"]),
        uv: json["uv"],
        windKph: json["wind_kph"],
        windDir: json["wind_dir"],
        humidity: json["humidity"],
        feelsLike: json["feelslike_c"],
        dewPoint: json["dewpoint_c"],
        visKm: json["vis_km"]);
  }
}

class Condition {
  final String text;
  final String icon;

  Condition({required this.text, required this.icon});
  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(text: json["text"], icon: json["icon"]);
  }
}

class AirQuality {
  final num co;
  final num no2;
  final num o3;
  final num so2;
  final num pm2_5;
  final num pm10;
  final num usEpaIndex;
  final num gbDefraIndex;

  AirQuality(
      {required this.co,
      required this.no2,
      required this.o3,
      required this.so2,
      required this.pm2_5,
      required this.pm10,
      required this.usEpaIndex,
      required this.gbDefraIndex});
  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
        co: json["co"],
        no2: json["no2"],
        o3: json["o3"],
        so2: json["so2"],
        pm2_5: json["pm2_5"],
        pm10: json['pm10'],
        usEpaIndex: json['us-epa-index'],
        gbDefraIndex: json["gb-defra-index"]);
  }
}

class Forecast {
  final List<ForecastDay> forecastDay;

  Forecast({required this.forecastDay});
  factory Forecast.fromJson(Map<String, dynamic> json) {
    var forecastDays = (json['forecastday'] as List)
        .map((day) => ForecastDay.fromJson(day))
        .toList();
    return Forecast(forecastDay: forecastDays);
  }
}

class ForecastDay {
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  ForecastDay({required this.day, required this.astro, required this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var hourList = (json['hour'] as List).map((h) => Hour.fromJson(h)).toList();

    return ForecastDay(
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour: hourList);
  }
}

class Day {
  final num maxTemp;
  final num minTemp;
  final num rainfall;
  final num dailyRain;

  Day({required this.dailyRain, required this.rainfall,required this.maxTemp, required this.minTemp});
  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(rainfall:json["daily_will_it_rain"],maxTemp: json["maxtemp_c"], minTemp: json["mintemp_c"], dailyRain: json["daily_chance_of_rain"]);
  }
}

class Astro {
  final String sunrise;
  final String moonrise;
  final String sunset;
  final String moonset;

  Astro(
      {required this.sunrise,
      required this.moonrise,
      required this.sunset,
      required this.moonset});
  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
        sunrise: json["sunrise"],
        moonrise: json["moonrise"],
        sunset: json["sunset"],
        moonset: json["moonset"]);
  }
}

class Hour {
  final String time;
  final Condition condition;
  final num temp;

  Hour({required this.time, required this.condition, required this.temp});
  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
        time: json["time"],
        condition: Condition.fromJson(json["condition"]),
        temp: json["temp_c"]);
  }
}
