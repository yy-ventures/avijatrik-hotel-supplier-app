import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class InitialLanguageEvent extends LanguageEvent {
  const InitialLanguageEvent();

  @override
  List<Object?> get props => [];
}

class ChangeLanguage extends LanguageEvent {
  const ChangeLanguage({required this.toggle, required this.languageCode});
  final bool toggle;
  final String languageCode;
  @override
  List<Object?> get props => [toggle, languageCode];
}
