import 'dart:convert';

import 'package:bloc_example/models/weather_info.dart';

class ApiResponse {
  bool success;
  List<WeatherInfo>? result;
  String? message;

  ApiResponse({required this.success, this.result, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        success: json['success'],
        result: json['result'] == null
            ? json['result']
            : List<WeatherInfo>.from(
                json['result'].map(
                  (e) => WeatherInfo.fromJson(e as Map<String, dynamic>),
                ),
              ),
        message: json['message']);
  }
}
