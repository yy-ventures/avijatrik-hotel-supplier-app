import 'package:avijatrik_hotel_supplier_app/models/global/global_item.dart';
import 'package:avijatrik_hotel_supplier_app/models/global/location.dart';

class BidInfo {
  BidInfo({
    this.id,
    this.userId,
    this.adultPax,
    this.childPax,
    this.checkInDate,
    this.checkOutDate,
    this.numberOfRoom,
    this.minPrice,
    this.maxPrice,
    this.startTime,
    this.endTime,
    this.type,
    this.isExpired,
    this.isClosed,
    this.primaryPreferences,
    this.otherPreferences,
    this.supplierSubmittedBidCount,
    this.location,
    this.roomCategory,
    this.roomType,
  });

  BidInfo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    adultPax = json['AdultPax'];
    childPax = json['ChildPax'];
    checkInDate = json['CheckInDate'];
    checkOutDate = json['CheckOutDate'];
    numberOfRoom = json['NumberOfRoom'];
    minPrice = json['MinPrice'];
    maxPrice = json['MaxPrice'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    type = json['Type'];
    isExpired = json['IsExpired'];
    isClosed = json['IsClosed'];
    primaryPreferences = json['PrimaryPreferences'];
    otherPreferences = json['OtherPreferences'];
    supplierSubmittedBidCount = json['SupplierSubmittedBidCount'];
    if (json['Location'] != null) {
      location = Location.fromJson(json['Location']);
    }
    if (json['RoomCategory'] != null) {
      roomCategory = GlobalItem.fromJson(json['RoomCategory']);
    }
    if (json['RoomType'] != null) {
      roomType = GlobalItem.fromJson(json['RoomType']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['Id'] = id;
    data['UserId'] = userId;
    data['AdultPax'] = adultPax;
    data['ChildPax'] = childPax;
    data['CheckInDate'] = checkInDate;
    data['CheckOutDate'] = checkOutDate;
    data['NumberOfRoom'] = numberOfRoom;
    data['MinPrice'] = minPrice;
    data['MaxPrice'] = maxPrice;
    data['StartTime'] = startTime;
    data['EndTime'] = endTime;
    data['Type'] = type;
    data['IsExpired'] = isExpired;
    data['IsClosed'] = isClosed;
    data['PrimaryPreferences'] = primaryPreferences;
    data['OtherPreferences'] = otherPreferences;
    data['SupplierSubmittedBidCount'] = supplierSubmittedBidCount;
    if (location != null) {
      data['Location'] = location?.toJson();
    }
    if (roomCategory != null) {
      data['RoomCategory'] = roomCategory?.toJson();
    }
    if (location != null) {
      data['RoomType'] = roomType?.toJson();
    }

    return data;
  }

  int? id;
  int? userId;
  int? adultPax;
  int? childPax;
  String? checkInDate;
  String? checkOutDate;
  int? numberOfRoom;
  num? minPrice;
  num? maxPrice;
  String? startTime;
  String? endTime;
  int? type;
  bool? isExpired;
  bool? isClosed;
  String? primaryPreferences;
  String? otherPreferences;
  int? supplierSubmittedBidCount;
  Location? location;
  GlobalItem? roomCategory;
  GlobalItem? roomType;
}
