import 'package:bloc/bloc.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:flutter/material.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(
          LanguageState(
            toggle: false,
            locale: Locale(
              selectedLanguage(),
            ),
          ),
        ) {
    on<InitialLanguageEvent>(_initialEvent);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  Future<void> _initialEvent(
    InitialLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageState(toggle: false, locale: Locale(selectedLanguage())));
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    DbHelper.saveData(
      Tables.appUtils,
      AppKeys.languageCode,
      event.languageCode,
    );
    emit(
      LanguageState(
        toggle: event.toggle,
        locale: Locale(event.languageCode),
      ),
    );
  }

  static String selectedLanguage() {
    final code = AppHelper.languageCode();

    return code;
  }
}
