part of 'locale_bloc.dart';

@immutable
class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({required this.locale});

  factory LocaleState.initial() => const LocaleState(locale: Locale('en'));

  LocaleState copyWith({Locale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }

  @override
  List<Object?> get props => [locale];
}
