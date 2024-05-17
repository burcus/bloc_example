import 'package:bloc_example/blocs/bloc_weather.dart';
import 'package:bloc_example/blocs/event_weather.dart';
import 'package:bloc_example/blocs/state_weather.dart';
import 'package:bloc_example/models/weather_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  final TextEditingController _textController = TextEditingController();
  late BlocWeather _blocWeather;

  @override
  void initState() {
    super.initState();
    _blocWeather = BlocProvider.of<BlocWeather>(context);
  }

  void _getWeatherInfo() {
    _blocWeather.add(EventWeatherGetInfo(_textController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Weather Info',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                  hintText: 'Istanbul, france, berlin...'),
            ),
          ),
          ElevatedButton(
            onPressed: _getWeatherInfo,
            child: const Text('Check Weather Info'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<BlocWeather, StateWeather>(
                builder: (context, state) {
              if (state is StateWeatherInfoFetching) {
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                );
              } else if (state is StateWeatherInfoFetched) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    WeatherInfo weatherInfo = state.weatherInfoList[index];
                    return ListTile(
                      title: Text(
                          '${weatherInfo.date.toString()} - ${weatherInfo.degree}\u00b0 - ${weatherInfo.status}'),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.weatherInfoList.length,
                );
              } else if (state is StateWeatherFailed) {
                return Text('There is an error: ${state.errorMessage}');
              } else if (_textController.text == "") {
                return const Text('Please enter a city name');
              } else {
                return const SizedBox();
              }
            }),
          )
        ],
      ),
    );
  }
}
