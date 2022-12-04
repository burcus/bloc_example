import 'package:bloc_example/models/weather_info.dart';

class ApiResponse {
  bool isSuccess;
  WeatherInfo? weatherInfo;
  String? errorMessage;

  ApiResponse({required this.isSuccess, this.weatherInfo, this.errorMessage});
}
