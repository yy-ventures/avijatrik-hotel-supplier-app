import 'package:avijatrik_hotel_supplier_app/models/hotel.dart';
import 'package:avijatrik_hotel_supplier_app/models/room.dart';

class SupplierSubmittedBid {
  SupplierSubmittedBid({
    this.supplierSubmittedBidId,
    this.regularPrice,
    this.discountedPrice,
    this.description,
    this.note,
    this.hotel,
    this.room,
    this.roomQuantity,
  });

  SupplierSubmittedBid.fromJson(Map<String, dynamic> json) {
    supplierSubmittedBidId = json['SupplierSubmittedBidId'];
    regularPrice = json['RegularPrice'];
    discountedPrice = json['DiscountedPrice'];
    description = json['Description'];
    note = json['Note'];
    if (json['Hotel'] != null) {
      hotel = Hotel.fromJson(json['Hotel']);
    }
    if (json['Room'] != null) {
      room = Room.fromJson(json['Room']);
    }
    roomQuantity = json['RoomQuantity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['SupplierSubmittedBidId'] = supplierSubmittedBidId;
    data['RegularPrice'] = regularPrice;
    data['DiscountedPrice'] = discountedPrice;
    data['RoomQuantity'] = roomQuantity;
    data['Description'] = description;
    data['Note'] = note;
    if (hotel != null) {
      data['Hotel'] = hotel?.toJson();
    }
    if (room != null) {
      data['Room'] = room?.toJson();
    }

    return data;
  }

  int? supplierSubmittedBidId;
  num? regularPrice;
  num? discountedPrice;
  String? description;
  String? note;
  Hotel? hotel;
  Room? room;
  int? roomQuantity;
}
