extension PhoneNumberParsing on String {
  String toCountryCode() {
    var phoneNumber = this;
    if (phoneNumber.length == 11) {
      phoneNumber = '88$phoneNumber';
    } else if (phoneNumber.length == 10) {
      phoneNumber = '880$phoneNumber';
    }

    return phoneNumber;
  }

  String removeCountryCode() {
    var phoneNumber = this;
    if (phoneNumber.length == 13) {
      phoneNumber = phoneNumber.substring(2, 13);
    }

    return phoneNumber;
  }
}
