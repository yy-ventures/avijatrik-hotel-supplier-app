import 'package:avijatrik_hotel_supplier_app/models/global/global_item.dart';
import 'package:avijatrik_hotel_supplier_app/models/global/image.dart';
import 'package:avijatrik_hotel_supplier_app/models/global/location.dart';
import 'package:avijatrik_hotel_supplier_app/models/review/index.dart';

class Hotel {
  Hotel({
    this.id,
    this.slug,
    this.name,
    this.featureImgUrl,
    this.minimumPerson,
    this.maximumPerson,
    this.featurePrice,
    this.discountPrice,
    this.fullDescription,
    this.propertyInformation,
    this.aroundHotel,
    this.isFeatured,
    this.reviewStatistics,
    this.primaryCategory,
    this.primaryLocation,
    this.types,
    this.abouts,
    this.images,
    this.categories,
    this.amenities,
    this.whatToExpects,
    this.faqs,
    this.reviews,
  });

  //ignore:long-method
  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    slug = json['Slug'];
    name = json['Name'];
    featureImgUrl = json['FeatureImgUrl'];
    minimumPerson = json['MinimumPersion'];
    maximumPerson = json['MaxmimumPerson'];
    featurePrice = json['FeaturePrice'];
    discountPrice = json['DiscountPrice'];
    fullDescription = json['FullDescription'];
    propertyInformation = json['PropertyInformation'];
    aroundHotel = json['AroundHotel'];
    isFeatured = json['IsFeatured'];
    if (json['ReviewStatistics'] != null) {
      reviewStatistics = ReviewStatistics.fromJson(json['ReviewStatistics']);
    }
    if (json['PrimaryCategory'] != null) {
      primaryCategory = GlobalItem.fromJson(json['PrimaryCategory']);
    }
    if (json['PrimaryLocation'] != null) {
      primaryLocation = Location.fromJson(json['PrimaryLocation']);
    }
    if (json['Types'] != null) {
      types = <GlobalItem>[];
      json['Types'].forEach((v) {
        types?.add(GlobalItem.fromJson(v));
      });
    }
    if (json['Abouts'] != null) {
      abouts = <GlobalItem>[];
      json['Abouts'].forEach((v) {
        abouts?.add(GlobalItem.fromJson(v));
      });
    }
    if (json['Images'] != null) {
      images = <GlobalImage>[];
      json['Images'].forEach((v) {
        images?.add(GlobalImage.fromJson(v));
      });
    }
    if (json['Categories'] != null) {
      categories = <GlobalItem>[];
      json['Categories'].forEach((v) {
        categories?.add(GlobalItem.fromJson(v));
      });
    }
    if (json['Amenities'] != null) {
      amenities = <GlobalItem>[];
      json['Amenities'].forEach((v) {
        amenities?.add(GlobalItem.fromJson(v));
      });
    }
    if (json['WhatToExpects'] != null) {
      whatToExpects = <GlobalItem>[];
      json['WhatToExpects'].forEach((v) {
        whatToExpects?.add(GlobalItem.fromJson(v));
      });
    }
    if (json['Faqs'] != null) {
      faqs = <GlobalItem>[];
      json['Faqs'].forEach((v) {
        faqs?.add(GlobalItem.fromJson(v));
      });
    }
    if (json['Reviews'] != null) {
      reviews = <Review>[];
      json['Reviews'].forEach((v) {
        reviews?.add(Review.fromJson(v));
      });
    }
  }

  //ignore:long-method
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Slug'] = slug;
    data['Name'] = name;
    data['FeatureImgUrl'] = featureImgUrl;
    data['MinimumPersion'] = minimumPerson;
    data['MaxmimumPerson'] = maximumPerson;
    data['FeaturePrice'] = featurePrice;
    data['DiscountPrice'] = discountPrice;
    data['FullDescription'] = fullDescription;
    data['PropertyInformation'] = propertyInformation;
    data['AroundHotel'] = aroundHotel;
    data['IsFeatured'] = isFeatured;
    if (reviewStatistics != null) {
      data['ReviewStatistics'] = reviewStatistics!.toJson();
    }
    if (primaryCategory != null) {
      data['PrimaryCategory'] = primaryCategory?.toJson();
    }
    if (primaryLocation != null) {
      data['PrimaryLocation'] = primaryLocation?.toJson();
    }
    if (types!.isNotEmpty) {
      data['Types'] = types!.map((v) => v.toJson()).toList();
    }
    if (abouts!.isNotEmpty) {
      data['Abouts'] = abouts!.map((v) => v.toJson()).toList();
    }
    if (images!.isNotEmpty) {
      data['Images'] = images!.map((v) => v.toJson()).toList();
    }
    if (categories!.isNotEmpty) {
      data['Categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (amenities!.isNotEmpty) {
      data['Amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    if (whatToExpects!.isNotEmpty) {
      data['WhatToExpects'] = whatToExpects!.map((v) => v.toJson()).toList();
    }
    if (faqs!.isNotEmpty) {
      data['Faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    if (reviews!.isNotEmpty) {
      data['Reviews'] = reviews!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  int? id;
  String? slug;
  String? name;
  String? featureImgUrl;
  int? minimumPerson;
  int? maximumPerson;
  num? featurePrice;
  num? discountPrice;
  String? fullDescription;
  String? propertyInformation;
  String? aroundHotel;
  bool? isFeatured;
  ReviewStatistics? reviewStatistics;
  GlobalItem? primaryCategory;
  Location? primaryLocation;
  List<GlobalItem>? types;
  List<GlobalItem>? abouts;
  List<GlobalImage>? images;
  List<GlobalItem>? categories;
  List<GlobalItem>? amenities;
  List<GlobalItem>? whatToExpects;
  List<GlobalItem>? faqs;
  List<Review>? reviews;
}
