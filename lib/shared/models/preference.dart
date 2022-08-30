class Preference {
  Preference({
    required this.id,
    required this.title,
    required this.iconUrl,
  });

  Preference.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    iconUrl = json['IconUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['Id'] = id;
    data['Title'] = title;
    data['IconUrl'] = iconUrl;

    return data;
  }

  late int id;
  late String title;
  late String iconUrl;
}
