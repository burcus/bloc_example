import 'dart:convert';
import 'dart:io';
import 'package:bloc_example/models/api_request.dart';
import 'package:bloc_example/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
/// A class that provides methods to fetch weather information from an API.
class WeatherApiService {
  static const String apiQuery =
      "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=";

  /// Fetches weather information for the specified city.
  ///
  /// Returns an [ApiResponse] object containing the weather information.
  /// If an error occurs during the API request, returns an [ApiResponse] object
  /// with success set to false and an error message.
  static Future<ApiResponse> fetchWeatherInfo(String city) async {
    late Response httpResponse;

    try {
      httpResponse = await http.get(Uri.parse('$apiQuery$city'), headers: {
        HttpHeaders.authorizationHeader: ApiRequest.authorization,
        HttpHeaders.contentTypeHeader: ApiRequest.contentType
      });
      if (httpResponse.statusCode == 200) {
        String responseBody = httpResponse.body;
        ApiResponse response = ApiResponse.fromJson(jsonDecode(responseBody));
        return response;
      } else {
        return ApiResponse(
            success: false, message: httpResponse.body.toString());
      }
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
  }
}
