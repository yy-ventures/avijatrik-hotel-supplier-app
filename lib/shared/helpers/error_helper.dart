class ErrorHelper {
  static String getErrorMessageByKey(
    Map<String, String> messages, {
    String key = 'generic',
  }) {
    var message = '';
    if (messages.isNotEmpty) {
      message = messages[key]??'';
    }

    return message;
  }
}
