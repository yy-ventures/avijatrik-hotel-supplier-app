class GlobalItem {
  GlobalItem({
    this.id,
    this.name,
    this.iconUrl,
    this.title,
    this.description,
    this.imgUrl,
    this.slug,
  });

  GlobalItem.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    title = json['Title'];
    description = json['Description'];
    imgUrl = json['ImgUrl'];
    iconUrl = json['IconUrl'];
    slug = json['Slug'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Title'] = title;
    data['Description'] = description;
    data['ImgUrl'] = imgUrl;
    data['IconUrl'] = iconUrl;
    data['Slug'] = iconUrl;

    return data;
  }

  late int? id;
  late String? name;
  late String? iconUrl;
  late String? title;
  late String? imgUrl;
  late String? description;
  late String? slug;
}
