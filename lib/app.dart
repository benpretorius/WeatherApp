import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/home/pages/home_page.dart';
import 'package:weatherApp/home/home_bloc.dart';
import 'package:weatherApp/home/home_state.dart';

class WeatherApp extends StatefulWidget {
  WeatherApp({Key key}) : super(key: key);

  @override
  State<WeatherApp> createState() => AppState();
}

class AppState extends State<WeatherApp> {
  HomeBloc _homeBloc;
  @override
  void dispose() {
    _homeBloc.drain();
    return super.dispose();
  }

  @override
  void initState() {
    _homeBloc = HomeBloc(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => _homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        cubit: _homeBloc,
        builder: (BuildContext context, HomeState state) {
          List<Widget> widgets = [];
          //   if (state.isAuthenticated) {
          widgets.add(HomePage());
          //   _homeBloc.add(Authenticated(isAuthenticated: true));
          //  }
          return Stack(children: widgets);
        },
      ),
    );
  }
}
