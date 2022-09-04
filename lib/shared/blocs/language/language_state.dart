import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageState extends Equatable {
  LanguageState({required this.toggle, required this.locale});
  bool toggle;
  Locale locale;

  @override
  List<Object?> get props => [toggle, locale];
}
