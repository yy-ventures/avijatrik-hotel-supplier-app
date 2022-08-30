part of 'internet_cubit.dart';

@immutable
abstract class InternetState extends Equatable {}

class InternetConnectionChecking extends InternetState {
  InternetConnectionChecking();

  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetState {
  InternetConnected({required this.connectionType});

  final ConnectionType connectionType;
  @override
  List<Object> get props => [connectionType];
}

class InternetDisconnected extends InternetState {
  @override
  List<Object> get props => [];
}

class RetryingConnectionState extends InternetState {
  @override
  List<Object> get props => [];
}
