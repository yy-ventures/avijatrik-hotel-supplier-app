import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState({required this.authenticationStatus});

  final AuthenticationStatus authenticationStatus;

  @override
  List<Object?> get props => [authenticationStatus];
}

class AppInitial extends AuthState {
  const AppInitial({required this.status})
      : super(authenticationStatus: status);
  final AuthenticationStatus status;

  @override
  List<Object?> get props => [status];
}

class UnAuthenticated extends AuthState {
  const UnAuthenticated({required this.status})
      : super(authenticationStatus: status);
  final AuthenticationStatus status;

  @override
  List<Object?> get props => [status];
}

class Authenticated extends AuthState {
  const Authenticated({
    required this.status,
    this.hasPreferences = false,
  }) : super(authenticationStatus: status);

  final AuthenticationStatus status;
  final bool hasPreferences;

  @override
  List<Object?> get props => [status, hasPreferences];
}

class AuthenticationFailedDueToInternetConnection extends AuthState {
  const AuthenticationFailedDueToInternetConnection({required this.status})
      : super(authenticationStatus: status);
  final AuthenticationStatus status;

  @override
  List<Object?> get props => [status];
}
