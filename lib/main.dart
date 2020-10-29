import 'package:flutter/material.dart';
import 'package:weatherApp/app.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static double fontsize = 16.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      themeMode: ThemeMode.light,
      home: WeatherApp(),
    );
  }
}
