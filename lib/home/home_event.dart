import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([Iterable props]) : super();
  @override
  List<Object> get props => [props];
}

class Authenticated extends HomeEvent {
  final bool isAuthenticated;
  Authenticated({@required this.isAuthenticated}) : super([isAuthenticated]);
}
