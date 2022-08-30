import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIKeys {
  static final String IAM_CLIENT_ID = dotenv.get('IAM_CLIENT_ID');
}
