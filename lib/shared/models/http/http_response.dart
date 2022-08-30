import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';

class HttpResponse {
  HttpResponse({
    this.payload,
    this.statusCode,
    this.error,
  });

  dynamic payload;
  int? statusCode;
  ErrorInfo? error;
}
