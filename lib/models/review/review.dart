import 'package:avijatrik_hotel_supplier_app/models/product_category.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';

class Review {
  Review({
    this.id,
    this.title,
    this.description,
    this.rating,
    this.date,
    this.productId,
    this.productCategory,
    this.userInfo,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    description = json['Description'];
    rating = json['Rating'];
    date = json['Date'];
    productId = json['ProductId'];
    productCategory = json['ProductCategory'] != null
        ? ProductCategoryDTO.fromJson(json['ProductCategory'])
        : null;
    userInfo =
        json['UserInfo'] != null ? User.fromJson(json['UserInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['Description'] = description;
    data['Rating'] = rating;
    data['Date'] = date;
    data['ProductId'] = productId;
    if (productCategory != null) {
      data['ProductCategory'] = productCategory!.toJson();
    }
    if (userInfo != null) {
      data['UserInfo'] = userInfo!.toJson();
    }

    return data;
  }

  int? id;
  String? title;
  String? description;
  int? rating;
  String? date;
  int? productId;
  ProductCategoryDTO? productCategory;
  User? userInfo;
}
