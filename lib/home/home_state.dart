import 'package:meta/meta.dart';

class HomeState {
  final bool isLoading;

  final String status;
  bool isAuthenticated;

  void dispose() {}

  HomeState(
      {@required this.isLoading,
      @required this.status,
      this.isAuthenticated})
      : super();

  factory HomeState.initial() {
    return HomeState(isLoading: false, status: 'Initialized');
  }

  factory HomeState.loading() {
    return HomeState(isLoading: true, status: 'Loading');
  }

  factory HomeState.failure({@required String error}) {
    return HomeState(isLoading: true, status: error);
  }

  @override
  factory HomeState.success(bool isAuthenticated) {
    return HomeState(
        isLoading: false,
        status: 'Authenticated',
        isAuthenticated: isAuthenticated,
);
  }
}
