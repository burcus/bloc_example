abstract class EventWeather {}

class EventWeatherGetInfo extends EventWeather {
  final String city;

  EventWeatherGetInfo(this.city);
}



