import 'package:avijatrik_hotel_supplier_app/shared/configs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:dio/dio.dart';

BaseOptions baseOptions = BaseOptions(
  //baseUrl: APIEndpoints.baseUrl,
  connectTimeout: AppConstants.connectionTimeOut,
  receiveTimeout: AppConstants.responseTimeOut,
);
