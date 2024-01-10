import 'package:bloc_example/models/weather_info.dart';

/// Represents the response from an API call.
class ApiResponse {
  bool success;
  List<WeatherInfo>? result;
  String? message;

  /// Constructs an instance of [ApiResponse].
  ///
  /// [success] indicates whether the API call was successful.
  /// [result] contains the weather information if the call was successful.
  /// [message] provides additional information or error message.
  ApiResponse({required this.success, this.result, this.message});

  /// Constructs an instance of [ApiResponse] from a JSON map.
  ///
  /// [json] is the JSON map representing the response.
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
