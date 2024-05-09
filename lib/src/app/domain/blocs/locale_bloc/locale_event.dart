part of 'locale_bloc.dart';

@immutable
sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

class LocaleChangeEvent extends LocaleEvent {
  final Locale locale;

  const LocaleChangeEvent({required this.locale});
}

class LocaleLoadEvent extends LocaleEvent {
  const LocaleLoadEvent();
}
