import 'package:flutter/material.dart';
import 'package:weatherApp/weather/weather_bloc.dart';
import 'package:weatherApp/weather/widgets/weather_list.dart';

class WeatherListPage extends StatelessWidget {
  final WeatherBloc weatherBloc;

  WeatherListPage({@required this.weatherBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7 Day Weather Forecast'),
        actions: <Widget>[],
      ),
      body: WeatherList(
        weatherBloc: weatherBloc,
      ),
    );
  }
}
