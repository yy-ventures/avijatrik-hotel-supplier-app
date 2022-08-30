import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DbHelper {
  static Future<void> createTables() async {
    await Hive.openBox<dynamic>(Tables.appUtils);
    await Hive.openBox<dynamic>(Tables.userInfo);
  }

  static void saveData(String table, String key, dynamic value) {
    final box = Hive.box<dynamic>(table);
    // ignore: cascade_invocations
    box.put(key, value);
  }

  static dynamic getData(String table, String key) {
    final box = Hive.box<dynamic>(table);
    final dynamic data = box.get(key);

    return data ?? '';
  }

  static void clearTableData(String table) {
    Hive.box<dynamic>(table).clear();
  }
}
