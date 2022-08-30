import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginPhoneNumberInvalid extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginPhoneNumberValid extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  LoginSuccess();

  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  LoginFailed({required this.loginFailed});

  final bool loginFailed;

  @override
  List<Object?> get props => [loginFailed];
}

class LoginError extends LoginState {
  LoginError({required this.errors});

  final Map<String,String> errors;

  @override
  List<Object?> get props => [errors];
}
