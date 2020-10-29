import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherApp/weather/weather_model.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent([Iterable props]) : super();
  @override
  List<Object> get props => [props];
}

class LoadWeatherList extends WeatherEvent {
  LoadWeatherList();
  @override
  String toString() => 'LoadWeatherList';
}

class LoadWeatherForm extends WeatherEvent {
  final ForecastModel forecastModel;

  LoadWeatherForm({@required this.forecastModel}) : super([forecastModel]);

  @override
  String toString() => 'LoadWeatherForm';
}
