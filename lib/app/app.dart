import 'package:avijatrik_hotel_supplier_app/l10n/l10n.dart';
import 'package:avijatrik_hotel_supplier_app/shared/blocs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/cubits/index.dart';
import 'package:avijatrik_hotel_supplier_app/infrastructure/route.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(userService: UserService())
            ..add(
              const AppStarted(),
            ),
        ),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<InternetCubit, InternetState>(
            listener: (_, state) {
              if (state is InternetDisconnected) {
                print('Internet Disconnected...................');
              }
            },
          ),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: AppConstants.fontFamily,
                canvasColor: primaryWhite,
              ),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                // CustomAppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: state.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateRoute: AppRoute.onGenerateRoute,
              initialRoute: '/splash',
            );
          },
        ),
      ),
    );
  }
}
