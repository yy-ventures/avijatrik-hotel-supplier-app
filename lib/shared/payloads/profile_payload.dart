import 'dart:io';

class ProfileUpdatePayload {
  ProfileUpdatePayload({
    this.firstName = '',
    this.lastName='',
    this.email='',
    this.profileImage,
  });

  String firstName;
  String lastName;
  String email;
  File? profileImage;
}
