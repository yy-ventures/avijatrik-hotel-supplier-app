import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {}

class OtpLoading extends OtpState {
  @override
  List<Object?> get props => [];
}

class OtpInvalid extends OtpState {
  @override
  List<Object?> get props => [];
}

class OtpValid extends OtpState {
  @override
  List<Object?> get props => [];
}

class OtpVerificationSuccess extends OtpState {
  OtpVerificationSuccess({required this.success});

  final bool success;
  // final bool isNewUser;
  // final bool hasPreferences;

  @override
  // List<Object?> get props => [isNewUser, hasPreferences];
  List<Object?> get props => [success];
}

class OtpVerificationFailed extends OtpState {
  OtpVerificationFailed({required this.messages});

  final Map<String, String> messages;

  @override
  List<Object?> get props => [messages];
}

class OtpError extends OtpState {
  OtpError({required this.errors});

  final Map<String, dynamic> errors;

  @override
  List<Object?> get props => [errors];
}
