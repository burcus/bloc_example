import 'dart:convert';
import 'dart:io';
import 'package:bloc_example/models/api_request.dart';
import 'package:bloc_example/models/api_response.dart';
import 'package:bloc_example/models/weather_info.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WeatherApiService {
  static const String apiQuery =
      "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=";

  static Future<ApiResponse> fetchWeatherInfo(String city) async {
    late Response httpResponse;
    try {
      httpResponse = await http.get(Uri.parse('$apiQuery$city'), headers: {
        HttpHeaders.authorizationHeader: ApiRequest.authorization,
        HttpHeaders.contentTypeHeader: ApiRequest.contentType
      });

      if (httpResponse.statusCode == 200) {
        String result = httpResponse.body;
        return ApiResponse(
            isSuccess: true,
            weatherInfo: WeatherInfo.fromJson(jsonDecode(result)));
      } else {
        // String result = httpResponse. todo credential değiştir
        return ApiResponse(isSuccess: false, errorMessage: "");
      }
    } catch (e) {
      return ApiResponse(isSuccess: false, errorMessage: e.toString());
    }
  }
}
