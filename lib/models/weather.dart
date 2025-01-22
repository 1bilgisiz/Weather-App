import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.consolidatedWeather,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.sources,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });

  List<ConsolidatedWeather> consolidatedWeather;
  DateTime time;
  DateTime sunRise;
  DateTime sunSet;
  String timezoneName;
  Parent parent;
  List<Source> sources;
  String title;
  String locationType;
  int woeid;
  String lattLong;
  String timezone;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        consolidatedWeather: (json["consolidated_weather"] as List<dynamic>?)
                ?.map((x) => ConsolidatedWeather.fromJson(x))
                .toList() ??
            [],
        time: DateTime.parse(json["time"] ?? DateTime.now().toIso8601String()),
        sunRise: DateTime.parse(json["sun_rise"] ?? DateTime.now().toIso8601String()),
        sunSet: DateTime.parse(json["sun_set"] ?? DateTime.now().toIso8601String()),
        timezoneName: json["timezone_name"] ?? "",
        parent: Parent.fromJson(json["parent"] ?? {}),
        sources: (json["sources"] as List<dynamic>?)
                ?.map((x) => Source.fromJson(x))
                .toList() ??
            [],
        title: json["title"] ?? "",
        locationType: json["location_type"] ?? "",
        woeid: json["woeid"] ?? 0,
        lattLong: json["latt_long"] ?? "",
        timezone: json["timezone"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "consolidated_weather":
            consolidatedWeather.map((x) => x.toJson()).toList(),
        "time": time.toIso8601String(),
        "sun_rise": sunRise.toIso8601String(),
        "sun_set": sunSet.toIso8601String(),
        "timezone_name": timezoneName,
        "parent": parent.toJson(),
        "sources": sources.map((x) => x.toJson()).toList(),
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
        "timezone": timezone,
      };
}

class ConsolidatedWeather {
  ConsolidatedWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  DateTime created;
  DateTime applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  double visibility;
  int predictability;

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) => ConsolidatedWeather(
        id: json["id"] ?? 0,
        weatherStateName: json["weather_state_name"] ?? "",
        weatherStateAbbr: json["weather_state_abbr"] ?? "",
        windDirectionCompass: json["wind_direction_compass"] ?? "",
        created: DateTime.parse(json["created"] ?? DateTime.now().toIso8601String()),
        applicableDate: DateTime.parse(json["applicable_date"] ?? DateTime.now().toIso8601String()),
        minTemp: (json["min_temp"] ?? 0).toDouble(),
        maxTemp: (json["max_temp"] ?? 0).toDouble(),
        theTemp: (json["the_temp"] ?? 0).toDouble(),
        windSpeed: (json["wind_speed"] ?? 0).toDouble(),
        windDirection: (json["wind_direction"] ?? 0).toDouble(),
        airPressure: (json["air_pressure"] ?? 0).toDouble(),
        humidity: json["humidity"] ?? 0,
        visibility: (json["visibility"] ?? 0).toDouble(),
        predictability: json["predictability"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date": applicableDate.toIso8601String(),
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };
}

class Parent {
  Parent({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  String title;
  String locationType;
  int woeid;
  String lattLong;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        title: json["title"] ?? "",
        locationType: json["location_type"] ?? "",
        woeid: json["woeid"] ?? 0,
        lattLong: json["latt_long"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
      };
}

class Source {
  Source({
    required this.title,
    required this.slug,
    required this.url,
    required this.crawlRate,
  });

  String title;
  String slug;
  String url;
  int crawlRate;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        url: json["url"] ?? "",
        crawlRate: json["crawl_rate"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "url": url,
        "crawl_rate": crawlRate,
      };
}
