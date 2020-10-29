import 'package:flutter/material.dart';
import 'package:weatherApp/home/home_bloc.dart';
import 'package:weatherApp/home/home_state.dart';
import 'package:weatherApp/weather/weather.dart';
import 'package:weatherApp/weather/pages/weather_list_page.dart';
import 'package:weatherApp/weather/weather_repository.dart';
//import '../widgets/app_drawer.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  HomeBloc get _homeBloc => new HomeBloc(context: context);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      cubit: _homeBloc,
      builder: (
        BuildContext context,
        HomeState homeState,
      ) {
        if (homeState.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return _homePage();
        }
      },
    );
  }

  Widget _homePage() {
    final WeatherRepository _weatherRepository = new WeatherRepository();
    final WeatherBloc _weatherBloc = new WeatherBloc(
        context: context, weatherRepository: _weatherRepository);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App Home',
          style: TextStyle(
            fontFamily: 'Grandstander',
          ),
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.refresh),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Column(children: [
        Container(
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
              image: AssetImage('assets/images/weather.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          height: 200,
          width: double.infinity,
        ),
        SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.only(left: 50.0, right: 50.0),
          child: FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WeatherListPage(weatherBloc: _weatherBloc)));
              setState(() {
                _weatherBloc.add(LoadWeatherList());
                _weatherBloc.close();
              });
            },
            child: Center(
              child: Text(
                'View 7 Day ForeCast',
                style: TextStyle(
                  fontFamily: 'Grandstander',
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
