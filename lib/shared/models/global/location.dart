class Location {
  Location(
      {this.id,
        this.slug,
        this.name,
        this.description,
        this.featureImgUrl,
        this.lat,
        this.long,});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    slug = json['Slug'];
    name = json['Name'];
    description = json['Description'];
    featureImgUrl = json['FeatureImgUrl'];
    lat = json['Lat'];
    long = json['Long'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Slug'] = slug;
    data['Name'] = name;
    data['Description'] = description;
    data['FeatureImgUrl'] = featureImgUrl;
    data['Lat'] = lat;
    data['Long'] = long;

    return data;
  }

  int? id;
  String? slug;
  String? name;
  String? description;
  String? featureImgUrl;
  double? lat;
  double? long;
}
