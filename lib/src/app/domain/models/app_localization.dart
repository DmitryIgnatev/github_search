import 'package:flutter/material.dart';

enum AppLanguage {
  english(Locale('en')),
  russian(Locale('ru'));

  final Locale locale;
  const AppLanguage(this.locale);
}

class AppLocalization {
  static String languageFlagPath(AppLanguage language) {
    switch (language) {
      case AppLanguage.english:
        return 'assets/images/uk_flag.jpg';
      case AppLanguage.russian:
        return 'assets/images/russian_flag.jpg';
      default:
        return 'assets/images/uk_flag.jpg';
    }
  }

  static AppLanguage appLanguage(Locale locale) {
    if (locale == const Locale('ru')) {
      return AppLanguage.russian;
    } else {
      return AppLanguage.english;
    }
  }
}
