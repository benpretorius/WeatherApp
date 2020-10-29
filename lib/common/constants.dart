import 'package:flutter/material.dart';

class AppConstants extends InheritedWidget {
  static AppConstants of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConstants>();

  const AppConstants({Widget child, Key key}) : super(key: key, child: child);
  static const api_key = 'fada45a7c4mshfd97ec4668c1499p18707bjsn5e845d1b666b';

  //API Endpoints
  final String urlDailyForecast =
      'https://community-open-weather-map.p.rapidapi.com/forecast/daily';

  @override
  bool updateShouldNotify(AppConstants oldWidget) => false;
}
