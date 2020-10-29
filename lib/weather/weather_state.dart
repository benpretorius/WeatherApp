import 'package:meta/meta.dart';
import 'package:weatherApp/weather/weather_model.dart';

class WeatherState {
  final bool isLoading;
  final bool isCreateButtonEnabled;
  final String error;
  final WeatherForecastModel weatherModel;

  void dispose() {}

  WeatherState(
      {@required this.isLoading,
      @required this.isCreateButtonEnabled,
      @required this.error,
      this.weatherModel})
      : super();

  factory WeatherState.initial() {
    return WeatherState(
        isLoading: false, isCreateButtonEnabled: true, error: '');
  }

  factory WeatherState.loading() {
    return WeatherState(
        isLoading: true, isCreateButtonEnabled: false, error: '');
  }

  factory WeatherState.failure(String error) {
    return WeatherState(
        isLoading: false, isCreateButtonEnabled: true, error: error);
  }
  @override
  factory WeatherState.success({WeatherForecastModel weatherModel}) {
    return WeatherState(
        isLoading: false,
        isCreateButtonEnabled: true,
        error: '',
        weatherModel: weatherModel);
  }
}
