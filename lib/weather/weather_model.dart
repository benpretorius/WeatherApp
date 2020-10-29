class WeatherForecastModel {
  WeatherForecastModel({this.city, this.forecasts, this.temperature});

  final CityModel city;
  final List<ForecastModel> forecasts;
  double temperature;

  WeatherForecastModel fromJson(Map<dynamic, dynamic> json) {
    var result = new WeatherForecastModel(
        city: CityModel().fromJson(json['city']),
        forecasts: ForecastListModel().fromJson(json['list']));

    return result;
  }
}

class CityModel {
  CityModel({this.name, this.areaDescription});

  final String name;
  String areaDescription;
  CityModel fromJson(Map<dynamic, dynamic> json) {
    var result = new CityModel(name: json['name'] as String);

    return result;
  }

  Map<String, dynamic> toJson() => {'name': name};
}

class ForecastModel {
  ForecastModel(
      {this.date,
      this.temperatureList,
      this.humidity,
      this.windSpeed,
      this.weatherDetailModel});

  final int date;
  final TemperatureModel temperatureList;
  final dynamic humidity;
  final dynamic windSpeed;
  final WeatherDetailModel weatherDetailModel;

  ForecastModel fromJson(json) {
    var result = new ForecastModel(
      date: json['dt'] as int,
      temperatureList: TemperatureModel().fromJson(json['temp']),
      humidity: json['humidity'] as int,
      windSpeed: json['windspeed'] as dynamic,
      weatherDetailModel: WeatherDetailModel().fromJson(json['weather'][0]),
    );

    return result;
  }
}

class TemperatureModel {
  TemperatureModel({this.day, this.min, this.max, this.night});
  final dynamic day;
  final dynamic min;
  final dynamic max;
  final dynamic night;

  TemperatureModel fromJson(Map<dynamic, dynamic> json) {
    var result = new TemperatureModel(
      day: json['day'] as dynamic,
      min: json['min'] as dynamic,
      max: json['max'] as dynamic,
      night: json['night'] as dynamic,
    );

    return result;
  }
}

class WeatherDetailModel {
  WeatherDetailModel({this.main, this.description, this.icon});
  final String main;
  final String description;
  final String icon;

  WeatherDetailModel fromJson(json) {
    var result = new WeatherDetailModel(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

    return result;
  }
}

class ForecastListModel {
  ForecastListModel({this.forecasts});
  List<ForecastModel> forecasts;

  List<ForecastModel> fromJson(json) {
    forecasts = new List<ForecastModel>();
    try {
      for (var item in json) {
        ForecastModel forecast = new ForecastModel().fromJson(item);
        forecasts.add(forecast);
      }
    } catch (e) {
      print(e);
    }

    return forecasts;
  }
}
