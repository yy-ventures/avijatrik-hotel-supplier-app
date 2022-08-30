class AdditionalService {
  AdditionalService({
    this.id,
    this.name,
    this.description,
    this.iconUrl,
    this.price,
    this.endDate,
  });

  AdditionalService.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    iconUrl = json['IconUrl'];
    price = json['Price'];
    endDate = json['EndDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Description'] = description;
    data['IconUrl'] = iconUrl;
    data['Price'] = price;
    data['EndDate'] = endDate;

    return data;
  }

  int? id;
  String? name;
  String? description;
  String? iconUrl;
  num? price;
  String? endDate;
}
