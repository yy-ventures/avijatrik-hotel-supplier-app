import 'package:avijatrik_hotel_supplier_app/shared/configs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';

class HomePageService {
  Future<HttpResponse> getHomePageData({
    int tourCategoryPageSize = 8,
    int tourPageSize = 0,
    int holidayHomeCategoryPageSize = 0,
    int holidayHomePageSize = 0,
  }) async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/home';
    final queryParameters = {
      'tourCategoryCount': tourCategoryPageSize,
      'tourCount': tourPageSize,
      'holidayHomeCategoryCount': holidayHomeCategoryPageSize,
      'holidayHomeCount': holidayHomePageSize,
    };

    final response =
        await HttpService.get(url, queryParameters: queryParameters);

    return response;
  }
}
