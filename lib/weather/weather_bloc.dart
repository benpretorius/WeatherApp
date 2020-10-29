import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:weatherApp/weather/weather.dart';
import 'package:weatherApp/weather/weather_model.dart';
import 'package:weatherApp/weather/weather_repository.dart';
//import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final BuildContext context;
  final WeatherRepository weatherRepository;
  Coordinates _coordinates;
  String _areaDetails = '';
  WeatherBloc({@required this.weatherRepository, @required this.context})
      : assert(weatherRepository != null),
        super(WeatherState.initial());

  void dispose() {
    this.close();
  }

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is LoadWeatherList) {
      yield WeatherState.loading();
      try {
        await _getLocation();
        WeatherForecastModel result =
            await weatherRepository.fetchWeatherForecast(
                latitude: _coordinates.latitude,
                longitude: _coordinates.longitude);

        if (result != null) {
          result.city.areaDescription = _areaDetails;
          yield WeatherState.success(
              weatherModel: result);
        }
      } catch (error) {
        yield WeatherState.failure(error.toString());
      }
    }
  }

  _getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    _coordinates = coordinates;
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    _areaDetails = "${first.addressLine}";
    // print("${first.featureName} : ${first.addressLine}");
  }
}
