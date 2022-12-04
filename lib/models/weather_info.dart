import 'dart:convert';

class WeatherInfo {
  WeatherInfo({
    required this.date,
    required this.day,
    required this.icon,
    required this.description,
    required this.status,
    required this.degree,
    required this.min,
    required this.max,
    required this.night,
  });

  String date;
  String day;
  String icon;
  String description;
  String status;
  String degree;
  String min;
  String max;
  String night;

  WeatherInfo copyWith({
    required String date,
    required String day,
    required String icon,
    required String description,
    required String status,
    required String degree,
    required String min,
    required String max,
    required String night,
  }) =>
      WeatherInfo(
        date: date,
        day: day,
        icon: icon,
        description: description,
        status: status,
        degree: degree,
        min: min,
        max: max,
        night: night,
      );

  factory WeatherInfo.fromRawJson(String str) =>
      WeatherInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => WeatherInfo(
        date: json["date"],
        day: json["day"],
        icon: json["icon"],
        description: json["description"],
        status: json["status"],
        degree: json["degree"],
        min: json["min"],
        max: json["max"],
        night: json["night"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "day": day,
        "icon": icon,
        "description": description,
        "status": status,
        "degree": degree,
        "min": min,
        "max": max,
        "night": night,
      };
}
