import 'dart:convert';

import 'package:avijatrik_hotel_supplier_app/payloads/supplier_bid_payload.dart';
import 'package:avijatrik_hotel_supplier_app/shared/configs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:intl/intl.dart';

class BidService {
  Future<HttpResponse> getBids({
    int pageSize = 10,
    int currentPage = 1,
    bool isExpired = true,
    bool isApproved = true,
  }) async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/hotelsupplier/bid/list';
    final queryParameters = {
      'pageSize': pageSize,
      'currentPage': currentPage,
      'isExpired': isExpired,
      'isApproved': isApproved,
    };

    final response =
        await HttpService.get(url, queryParameters: queryParameters);

    return response;
  }

  Future<HttpResponse> getBidDetails(int id) async {
    final url =
        '${APIEndpoints.AVIJATRIK_BASE_URL}/hotelsupplier/bid/details/{id}';
    final pathKey = {
      'id': id,
    };

    final response = await HttpService.get(url, pathKeys: pathKey);

    return response;
  }

  Future<HttpResponse> getRunningBid() async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/bid/running-bid';

    final response = await HttpService.get(url);

    return response;
  }

  Future<HttpResponse> getBidRequestFilters() async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/bid/filters';
    final response = await HttpService.get(url);

    return response;
  }

  Future<HttpResponse> checkCurrentBidIsRunning() async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/bid/check-bid-running';

    final response = await HttpService.get(url);

    return response;
  }

  Future<HttpResponse> submitSupplierBid(
    SupplierBidSubmitPayload supplierBid,
  ) async {
    final url = '${APIEndpoints.AVIJATRIK_BASE_URL}/hotelsupplier/submit-bid';

    final payload = {
      "BidId": supplierBid.bidId,
      "DiscountedPrice": supplierBid.discountedPrice,
      "RoomId": supplierBid.roomId,
      "NumberOfRoom": supplierBid.numberOfRooms,
      "Description": supplierBid.description,
      "Note": supplierBid.note
    };

    final response = await HttpService.post(url, body: payload);

    return response;
  }
}
