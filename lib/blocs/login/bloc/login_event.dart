import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
}

class CheckIsValidPhoneNumber extends LoginEvent {
  const CheckIsValidPhoneNumber({required this.phoneNumber});
  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];

  @override
  String toString() =>
      'CheckIsValidNumber { phone no: $phoneNumber}';
}

class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed({required this.phoneNumber});
  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];

  @override
  String toString() =>
      'LoginButtonPressed { phone no: $phoneNumber}';
}
