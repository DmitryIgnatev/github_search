import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleState.initial()) {
    on<LocaleChangeEvent>(_onLocaleChangeEvent);
    on<LocaleLoadEvent>(_onLocaleLoadEvent);
  }

  Future<void> _onLocaleChangeEvent(
      LocaleChangeEvent event, Emitter<LocaleState> emit) async {
    emit(state.copyWith(locale: event.locale));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', event.locale.languageCode);
  }

  Future<void> _onLocaleLoadEvent(
      LocaleLoadEvent event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final localeLanguageCode = prefs.getString('locale') ?? 'en';
    emit(state.copyWith(locale: Locale(localeLanguageCode)));
  }
}
