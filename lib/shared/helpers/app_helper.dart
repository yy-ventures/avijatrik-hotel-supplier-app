import 'dart:convert';

import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:io' show Platform;

class AppHelper {
  static Future<bool> hasInternetConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  static String languageCode() {
    final code =
        DbHelper.getData(Tables.appUtils, AppKeys.languageCode) as String;

    if (code == '') {
      DbHelper.saveData(
        Tables.appUtils,
        AppKeys.languageCode,
        AppConstants.languageCode,
      );
    }

    return code == '' ? AppConstants.languageCode : code;
  }

  static int appPlatform() => Platform.isAndroid ? 2 : 3; //2 Android and 3 Ios
  static Future<String> appSignatureID() async =>
      await SmsAutoFill().getAppSignature;

  static User? userInfo() {
    User? userInfo;
    final response =
        DbHelper.getData(Tables.userInfo, AppKeys.userInfo) as String;

    if (response.isNotEmpty) {
      final data = jsonDecode(response);
      if (data != null) {
        userInfo = User.fromJson(data);
      }
    }

    return userInfo;
  }

  static int userId() => userInfo() != null ? userInfo()!.id : 0;

  static String userIdentifier() =>
      userInfo() != null ? userInfo()!.phoneNumber : '';

  static String userFullName() => userInfo() != null
      ? '${userInfo()!.firstName} ${userInfo()!.lastName}'
      : '';

  static String userProfileImage() =>
      userInfo() != null ? '${userInfo()!.profileImage}' : '';

  static void clearUserInfo() =>
      DbHelper.saveData(Tables.userInfo, AppKeys.userInfo, '');

  static void closeApp() =>
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
