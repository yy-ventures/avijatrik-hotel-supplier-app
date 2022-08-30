import 'dart:io';

import 'package:avijatrik_hotel_supplier_app/shared/configs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/payloads/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<HttpResponse> getProfile() async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/user/profile';
    final response = await HttpService.get(url);

    return response;
  }

  Future<HttpResponse> updateProfile(
    ProfileUpdatePayload profileInfo,
  ) async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/user/profile';
    final payload = {
      'FirstName': profileInfo.firstName,
      'LastName': profileInfo.lastName,
      'Email': profileInfo.email,
    };

    final response = await HttpService.put(url, body: payload);

    return response;
  }

  Future<HttpResponse> updatePhoneNumber(
    String phoneNumber,
    int otp,
  ) async {
    final url =
        '${APIEndpoints.AVIJATRIK_BASE_URL}/user/profile/update-phone-number';
    final payload = {
      'PhoneNumber': phoneNumber.toCountryCode(),
      'Otp': otp,
    };

    final response = await HttpService.put(url, body: payload);

    return response;
  }

  Future<HttpResponse> uploadProfileImage(
    File profileImage,
  ) async {
    final url =
        '${APIEndpoints.AVIJATRIK_BASE_URL}/user/profile/upload-profile-image';

    final payload = FormData.fromMap(
      {
        'ProfileImage': await MultipartFile.fromFile(profileImage.path),
      },
    );

    final response = await HttpService.uploadFile(url, body: payload);

    return response;
  }

  Future<HttpResponse> deleteProfileImage() async {
    final url =
        '${APIEndpoints.AVIJATRIK_BASE_URL}/user/profile/delete-profile-image';

    final response = await HttpService.delete(url);

    return response;
  }
}
