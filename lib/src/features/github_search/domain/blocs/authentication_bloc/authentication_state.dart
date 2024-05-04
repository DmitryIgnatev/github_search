part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
  const factory AuthenticationState.initialized() = _Initialized;
  const factory AuthenticationState.successful() = _Successful;
  const factory AuthenticationState.error() = _Error;
}
