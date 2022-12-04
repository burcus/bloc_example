import 'package:bloc_example/blocs/event_weather.dart';
import 'package:bloc_example/blocs/state_weather.dart';
import 'package:bloc_example/models/api_response.dart';
import 'package:bloc_example/services/weather_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWeather extends Bloc<EventWeather, StateWeather> {
  BlocWeather() : super(StateWeatherInitialize()) {
    on<EventWeatherGetInfo>(_getWeatherInfo);
  }

  Future<void> _getWeatherInfo(EventWeatherGetInfo event, emit) async {
    emit(StateWeatherInfoFetching());
    ApiResponse response = await WeatherApiService.fetchWeatherInfo(event.city);
    if (response.isSuccess) {
      emit(StateWeatherInfoFetched(response.weatherInfo!));
    } else {
      emit(StateWeatherFailed(response.errorMessage ?? ''));
    }
  }
}
