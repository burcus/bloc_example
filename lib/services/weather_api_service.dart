import 'dart:convert';
import 'dart:io';
import 'package:bloc_example/models/api_request.dart';
import 'package:bloc_example/models/api_response.dart';
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
