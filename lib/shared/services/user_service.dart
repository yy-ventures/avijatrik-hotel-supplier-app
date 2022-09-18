import 'dart:io';

import 'package:avijatrik_hotel_supplier_app/shared/configs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<HttpResponse> getProfile() async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/user/profile';
    final response = await HttpService.get(url);

    return response;
  }
}
