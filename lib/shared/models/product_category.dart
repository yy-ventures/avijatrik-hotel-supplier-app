class ProductCategoryDTO {
  ProductCategoryDTO({
    this.name,
    this.value,
  });

  ProductCategoryDTO.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Name'] = name;
    data['Value'] = value;

    return data;
  }

  String? name;
  int? value;
}
