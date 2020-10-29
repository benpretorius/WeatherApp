import 'dart:async';
import 'package:weatherApp/weather/weather_model.dart';
import 'package:weatherApp/common/api_service.dart';
import 'package:meta/meta.dart';

class WeatherRepository {
  Future<WeatherForecastModel> fetchWeatherForecast(
      {@required double latitude, @required double longitude}) async {
    APIService apiService = APIService();
    var responseData = await apiService.get(endpoint: '/forecast/daily',
        //query: {"q": "pretoria,za", "units": "metric"});
        //query: {"lat": "$latitude", "lon": "$longitude", "units": "metric"});
        query: {"lat": "$latitude", "lon": "$longitude", "units": "metric"});

    WeatherForecastModel weatherModel = new WeatherForecastModel();
    var weatherForecast = weatherModel.fromJson(responseData);

    return weatherForecast;
  }
}
