import 'package:avijatrik_hotel_supplier_app/shared/configs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  Future<HttpResponse> sendOtp(String phoneNumber) async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/auth/otp';
    final payload = {
      'PhoneNumber': phoneNumber.toCountryCode(),
      'AppSignature': kIsWeb ? '' : await AppHelper.appSignatureID(),
    };

    final response = await HttpService.post(url, body: payload);

    return response;
  }

  Future<HttpResponse> verifyOtp(String phoneNumber, int otp) async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/auth/oauth/login';
    final payload = {
      'PhoneNumber': phoneNumber.toCountryCode(),
      'Otp': otp,
      'UserType': AppConstants.userType,
    };

    final response = await HttpService.post(url, body: payload);

    return response;
  }
}
