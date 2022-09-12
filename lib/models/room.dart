import 'package:avijatrik_hotel_supplier_app/models/additional_service.dart';
import 'package:avijatrik_hotel_supplier_app/models/global/global_item.dart';
import 'package:avijatrik_hotel_supplier_app/models/global/image.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';

class Room {
  Room({
    this.id,
    this.name,
    this.description,
    this.inclusion,
    this.featureImgUrl,
    this.unitPrice,
    this.discountPrice,
    this.vatCharges,
    this.endDate,
    this.adultCapacity,
    this.childCapacity,
    this.extraBed,
    this.qty,
    this.extraBedCapacity,
    this.extraBedPrice,
    this.category,
    this.types,
    this.images,
    this.additionalServices,
    this.amenities,
  });

  Room.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    inclusion = json['Inclusion'];
    featureImgUrl = json['FeatureImgUrl'];
    unitPrice = json['UnitPrice'];
    discountPrice = json['DiscountPrice'];
    vatCharges = json['VatCharges'];
    endDate = json['EndDate'];
    adultCapacity = json['AdultCapacity'];
    childCapacity = json['ChildCapacity'];
    extraBed = json['ExtraBed'];
    qty = json['Qty'];
    extraBedCapacity = json['ExtraBedCapacity'];
    extraBedPrice = json['ExtraBedPrice'];
    if (json['Category'] != null) {
      category = GlobalItem.fromJson(json['category']);
    }
    if (json['Types'] != null) {
      types = <GlobalItem>[];
      json['Types'].forEach((v) {
        types?.add(GlobalItem.fromJson(v));
      });
    }
    if (json['Images'] != null) {
      images = <GlobalImage>[];
      json['Images'].forEach((v) {
        images?.add(GlobalImage.fromJson(v));
      });
    }
    if (json['AdditionalServices'] != null) {
      additionalServices = <AdditionalService>[];
      json['AdditionalServices'].forEach((v) {
        additionalServices?.add(AdditionalService.fromJson(v));
      });
    }
    if (json['Amenities'] != null) {
      amenities = <GlobalItem>[];
      json['Amenities'].forEach((v) {
        amenities?.add(GlobalItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Description'] = description;
    data['Inclusion'] = inclusion;
    data['FeatureImgUrl'] = featureImgUrl;
    data['UnitPrice'] = unitPrice;
    data['DiscountPrice'] = discountPrice;
    data['VatCharges'] = vatCharges;
    data['EndDate'] = endDate;
    data['AdultCapacity'] = adultCapacity;
    data['ChildCapacity'] = childCapacity;
    data['ExtraBed'] = extraBed;
    data['Qty'] = qty;
    data['ExtraBedCapacity'] = extraBedCapacity;
    data['ExtraBedPrice'] = extraBedPrice;
    if (category != null) {
      data['Category'] = category?.toJson();
    }
    if (types!.isNotEmpty) {
      data['Types'] = types!.map((v) => v.toJson()).toList();
    }
    if (images!.isNotEmpty) {
      data['Images'] = images!.map((v) => v.toJson()).toList();
    }
    if (additionalServices!.isNotEmpty) {
      data['AdditionalServices'] =
          additionalServices!.map((v) => v.toJson()).toList();
    }
    if (amenities!.isNotEmpty) {
      data['Amenities'] = amenities!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  int? id;
  String? name;
  String? description;
  String? inclusion;
  String? featureImgUrl;
  num? unitPrice;
  num? discountPrice;
  int? vatCharges;
  String? endDate;
  int? adultCapacity;
  int? childCapacity;
  bool? extraBed;
  int? qty;
  int? extraBedCapacity;
  num? extraBedPrice;
  GlobalItem? category;
  List<GlobalItem>? types;
  List<GlobalImage>? images;
  List<AdditionalService>? additionalServices;
  List<GlobalItem>? amenities;
}
