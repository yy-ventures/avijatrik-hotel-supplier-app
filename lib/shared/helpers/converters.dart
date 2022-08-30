import 'package:intl/intl.dart';

class Converters {
  static dynamic mapKeyToValue(Map map, dynamic key) {
    return map[key];
  }

  static List<String> separatorTextToList(String text,
      {String separator = '|'}) {
    if (text.isEmpty) {
      return [];
    }
    final replaceText = text.replaceAll('\r\n', '');
    final list = replaceText.split('|');

    return list;
  }

  static String getCurrency(
    String localName,
    num amount, {
    String customPattern = '৳#,##,##0',
    int decimal = 2,
  }) {
    return NumberFormat.currency(
      locale: localName,
      decimalDigits: amount % 1 == 0 ? 0 : decimal,
      name: '',
      customPattern: customPattern,
    ).format(amount);
  }

  static String getNumericValue(String localName, num value) {
    return NumberFormat.currency(
      locale: localName,
      decimalDigits: 0,
      name: '',
      customPattern: '',
    ).format(value);
  }

  static String getCurrentMonth(int currentMonthIndex) {
    return DateFormat('MMM').format(DateTime(0, currentMonthIndex));
  }
}
