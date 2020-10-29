import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:weatherApp/home/home_state.dart';
import 'package:weatherApp/home/home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;
  bool isInitialized = false;

  HomeBloc({@required this.context}) : super(HomeState.initial());

  void dispose() {}

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is Authenticated) {
      yield HomeState.success(true);
    }
  }
}
