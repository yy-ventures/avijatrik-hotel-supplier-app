import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}


class CheckOtpValidation extends OtpEvent {
  const CheckOtpValidation({required this.otp});

  final String otp;

  @override
  List<Object?> get props => [otp];
}

class OtpSubmitButtonPressed extends OtpEvent {
  const OtpSubmitButtonPressed({
    required this.phoneNumber,
    required this.otp,
  });

  final String phoneNumber;
  final int otp;

  @override
  List<Object?> get props => [phoneNumber, otp];
}

class ResendOtp extends OtpEvent {
  const ResendOtp({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

