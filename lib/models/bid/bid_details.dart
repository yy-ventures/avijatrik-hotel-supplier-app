import 'package:avijatrik_hotel_supplier_app/models/bid/bid_info.dart';
import 'package:avijatrik_hotel_supplier_app/models/bid/supplier_submitted_bid.dart';

class BidDetails {
  BidDetails({
    this.bidInfo,
    this.supplierSubmittedBids,
  });

  BidDetails.fromJson(Map<String, dynamic> json) {
    if (json['BiddingInfo'] != null) {
      bidInfo = BidInfo.fromJson(json['BiddingInfo']);
    }
    if (json['SupplierSubmittedBids'] != null) {
      supplierSubmittedBids = <SupplierSubmittedBid>[];
      json['SupplierSubmittedBids'].forEach((v) {
        supplierSubmittedBids?.add(SupplierSubmittedBid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (bidInfo != null) {
      data['BiddingInfo'] = bidInfo?.toJson();
    }

    return data;
  }

  BidInfo? bidInfo;
  List<SupplierSubmittedBid>? supplierSubmittedBids;
}
