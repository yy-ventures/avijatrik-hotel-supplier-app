import 'dart:convert';

import 'package:avijatrik_hotel_supplier_app/blocs/otp/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:bloc/bloc.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({required this.authService}) : super(OtpInvalid()) {
    on<OtpSubmitButtonPressed>(_onPressedOtpSubmitButton);
    on<CheckOtpValidation>(_checkIsValidOtp);
    on<ResendOtp>(_onResndOtp);
  }

  final AuthService authService;

  Future<void> _checkIsValidOtp(
    CheckOtpValidation event,
    Emitter<OtpState> emit,
  ) async {
    if (event.otp.length == 6) {
      emit(OtpValid());
    } else {
      emit(OtpInvalid());
    }
  }

  Future<void> _onResndOtp(
    ResendOtp event,
    Emitter<OtpState> emit,
  ) async {
    await authService.sendOtp(event.phoneNumber);
  }

  Future<void> _onPressedOtpSubmitButton(
    OtpSubmitButtonPressed event,
    Emitter<OtpState> emit,
  ) async {
    emit(OtpLoading());
    final response = await authService.verifyOtp(event.phoneNumber, event.otp);
    if (response.error == null) {
      final payload = jsonDecode(response.payload);

      final user = User.fromJson(payload['User']);
      saveUserInfo(user);

      final token = TokenInfo.fromJson(payload['Token']);
      saveTokenInfo(token);

      emit(
        OtpVerificationSuccess(success: true),
      );
    } else {
      if (response.error?.statusCode == 500) {
        emit(
          OtpError(
            errors: response.error!.messages ?? {},
          ),
        );
      } else {
        emit(
          OtpVerificationFailed(
            messages: response.error!.messages ?? {},
          ),
        );
      }
    }
  }

  void saveUserInfo(User user) {
    final userInfo = jsonEncode(user.toJson());
    DbHelper.saveData(Tables.userInfo, AppKeys.userInfo, userInfo);
  }

  void saveTokenInfo(TokenInfo token) {
    final tokenInfo = jsonEncode(token.toJson());
    DbHelper.saveData(Tables.appUtils, AppKeys.tokenInfo, tokenInfo);
  }
}
