import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/weather.dart';
import 'package:weatherApp/weather/weather_bloc.dart';
import 'package:weatherApp/weather/weather_model.dart';
import 'package:intl/intl.dart';

class WeatherList extends StatefulWidget {
  final WeatherBloc weatherBloc;

  WeatherList({Key key, @required this.weatherBloc}) : super(key: key);

  @override
  WeatherListState createState() {
    return new WeatherListState();
  }
}

class WeatherListState extends State<WeatherList> {
  WeatherBloc get _weatherBloc => widget.weatherBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      cubit: _weatherBloc,
      builder: (
        BuildContext context,
        WeatherState weatherState,
      ) {
        if (weatherState.error.isNotEmpty) {
          _onWidgetDidBuild(() {
            return Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("An Error occurred."),
              ),
            );
          });
        }
        if (weatherState.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (weatherState.weatherModel?.forecasts != null) {
          return _weatherForeCastList(weatherState.weatherModel);
        }
        return Center(child: Text('No data'));
      },
    );
  }

  Widget _weatherForeCastList(WeatherForecastModel weather) {
    return new ListView.builder(
        shrinkWrap: true,
        itemCount:
            weather.forecasts.length == null ? 0 : weather.forecasts.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              index == 0
                  ? Padding(
                      child: Text(
                        weather.city.areaDescription.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                      padding: EdgeInsets.all(10),
                    )
                  : SizedBox(height: 0),
              index == 0 ? columnHeader() : SizedBox(height: 0),
              ListTile(
                leading: Text(DateFormat.E()
                    .add_MMM()
                    .add_d()
                    .add_y()
                    .format(DateTime.fromMillisecondsSinceEpoch(
                        weather.forecasts[index].date * 1000))
                    .toString()),
                title: Center(
                  child: Text(
                      weather.forecasts[index].temperatureList.day.toString() +
                          ' \u2103'),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.open_in_new),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              SelectedDayScreen(
                                  forecastModel: weather.forecasts[index])));
                    });
                  },
                ),
              )
            ],
          );
        });
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

Widget columnHeader() {
  return new ListTile(
    title: Row(children: <Widget>[
      Expanded(
        child: Text(
          "Date",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Text(
          "Temp",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ]),
  );
}

class SelectedDayScreen extends StatelessWidget {
  final ForecastModel forecastModel;

  SelectedDayScreen({@required this.forecastModel});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox.expand(
            // makes widget fullscreen
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      DateFormat.E()
                          .add_MMM()
                          .add_d()
                          .add_y()
                          .format(DateTime.fromMillisecondsSinceEpoch(
                              forecastModel.date * 1000))
                          .toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 2,
                //   child: SizedBox.expand(
                //     child: Image.network(
                //       'http://openweathermap.org/img/wn/${forecastModel.weatherDetailModel.icon}@2x.png',
                //     ),
                //   ),
                // ),String url = "http://via.placeholder.com/350x150";
                CachedNetworkImage(
                  imageUrl:
                      'http://openweathermap.org/img/wn/${forecastModel.weatherDetailModel.icon}@2x.png',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      'Description: ' +
                          forecastModel.weatherDetailModel.description,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      'Humidity: ' + forecastModel.humidity.toString() + '%',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      'Wind Speed: ' +
                          forecastModel.humidity.toString() +
                          ' km/h',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      'Day: ' +
                          forecastModel.temperatureList.day.toString() +
                          ' \u2103',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      'Evening: ' +
                          forecastModel.temperatureList.night.toString() +
                          ' \u2103',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      'Minimum: ' +
                          forecastModel.temperatureList.min.toString() +
                          ' \u2103',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: Text(
                      'Maximum: ' +
                          forecastModel.temperatureList.max.toString() +
                          ' \u2103',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: RaisedButton(
                      color: Colors.blue[600],
                      child: Text(
                        "Back to list",
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(1),
      ),
    );
  }
}
