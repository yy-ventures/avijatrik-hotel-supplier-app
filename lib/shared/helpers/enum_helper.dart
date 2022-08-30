import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';

//Backend service enum value start from 1, so use this enum value mapper.
//Example:ProductCategoryMap.tour.value

extension ProductCategoryMap on ProductCategory {
  static const valueMap = {
    ProductCategory.tour: 1,
    ProductCategory.holidayHome: 2,
    ProductCategory.hotel: 3,
  };

  int get value => valueMap[this]!;
}

extension BiddingTypeMap on BiddingType {
  static const valueMap = {
    BiddingType.open: 1,
    BiddingType.negotiate: 2,
  };

  int get value => valueMap[this]!;
}
