import 'package:avijatrik_hotel_supplier_app/app/app.dart';
import 'package:avijatrik_hotel_supplier_app/app/observer/app_bloc_observer.dart';
import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
// import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
// import 'package:avijatrik_hotel_supplier_app/startup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

Future<void> run(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(await builder()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.development');
  await Hive.initFlutter();
  await DbHelper.createTables();

  //Setting SystemUIOverlay

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then((_) {
    run(() => const App());
  });
}
