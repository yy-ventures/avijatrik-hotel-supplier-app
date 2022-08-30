import 'dart:convert';

import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';

class AuthHelper {
  static int currentTimeStamp() => DateTime.now().microsecondsSinceEpoch;

  static bool isAuthenticated() => tokenInfo() != null;

  static String accessToken() =>
      tokenInfo() != null ? tokenInfo()!.accessToken : '';

  static void clearToken() =>
      DbHelper.saveData(Tables.appUtils, AppKeys.tokenInfo, '');

  static String appLogRefId() =>
      'avijatrik-mobileapp-${AppHelper.userId()}-${currentTimeStamp()}';

  static TokenInfo? tokenInfo() {
    TokenInfo? tokenInfo;
    final response =
        DbHelper.getData(Tables.appUtils, AppKeys.tokenInfo) as String;

    if (response.isNotEmpty) {
      final data = jsonDecode(response);
      if (data != null) {
        tokenInfo = TokenInfo.fromJson(data);
      }
    }

    return tokenInfo;
  }

  static void logOut() {
    clearToken();
    AppHelper.clearUserInfo();
  }
}
