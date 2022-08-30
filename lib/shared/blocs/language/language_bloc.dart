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
            locale: Locale(
              selectedLanguage(),
            ),
          ),
        ) {
    on<InitialLanguageEvent>(_initialEvent);
    on<SelectLanguage>(_onSelectLanguage);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  Future<void> _initialEvent(
    InitialLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageState(locale: Locale(selectedLanguage())));
  }

  Future<void> _onSelectLanguage(
    SelectLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    emit(
      SelectedLanguage(
        locale: Locale(selectedLanguage()),
        languageCode: event.languageCode,
      ),
    );
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageLoading(locale: Locale(event.languageCode)));
    DbHelper.saveData(
      Tables.appUtils,
      AppKeys.languageCode,
      event.languageCode,
    );
    emit(LanguageState(locale: Locale(event.languageCode)));
  }

  static String selectedLanguage() {
    final code = AppHelper.languageCode();

    return code;
  }
}
