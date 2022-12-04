import 'package:bloc_example/models/weather_info.dart';

abstract class StateWeather {}

class StateWeatherInitialize extends StateWeather {}

class StateWeatherInfoFetching extends StateWeather {}


class StateWeatherInfoFetched extends StateWeather {
  final WeatherInfo weatherInfo;

  StateWeatherInfoFetched(this.weatherInfo);
}

class StateWeatherFailed extends StateWeather {
  final String errorMessage;

  StateWeatherFailed(this.errorMessage);
}





