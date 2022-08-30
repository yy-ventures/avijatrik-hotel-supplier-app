import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';

class User {
  User({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    this.email,
    this.profileImage,
    required this.type,
    required this.preferences,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    phoneNumber = json['PhoneNumber'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    profileImage = json['ProfileImage'];
    email = json['Email'];
    type = json['Type'];
    if (json['Preferences'] != null) {
      preferences = <Preference>[];
      json['Preferences'].forEach((v) {
        preferences.add(Preference.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['Id'] = id;
    data['PhoneNumber'] = phoneNumber;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['ProfileImage'] = profileImage;
    data['Email'] = email;
    data['Type'] = type;
    if (preferences.isNotEmpty) {
      data['Preferences'] = preferences.map((v) => v.toJson()).toList();
    }

    return data;
  }

  late int id;
  late String phoneNumber;
  late String firstName;
  late String lastName;
  String? profileImage;
  String? email;
  late int type;
  late List<Preference> preferences;
}

class ProfileBasicInfo {
  ProfileBasicInfo({
    this.id = 0,
    this.phoneNumber = '',
    this.firstName = '',
    this.lastName = '',
    this.profileImage = '',
    this.email = '',
  });

  int id;
  String phoneNumber;
  String firstName;
  String lastName;
  String profileImage;
  String email;
}
