import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageState extends Equatable {
  LanguageState({required this.locale});

  Locale locale;

  @override
  List<Object?> get props => [locale];
}

class LanguageLoading extends LanguageState {
  LanguageLoading({required this.locale}) : super(locale: locale);
  Locale locale;

  @override
  List<Object?> get props => [locale];
}

class SelectedLanguage extends LanguageState {
  SelectedLanguage({
    required this.locale,
    required this.languageCode,
  }) : super(locale: locale);

  Locale locale;
  String languageCode;

  @override
  List<Object?> get props => [locale, languageCode];
}
