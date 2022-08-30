import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AppStarted extends AuthEvent {
  const AppStarted();

  @override
  List<Object?> get props => [];
}

class ChangeAuthStatus extends AuthEvent {
  const ChangeAuthStatus({required this.authenticationStatus});
  final AuthenticationStatus authenticationStatus;

  @override
  List<Object?> get props => [];
}
