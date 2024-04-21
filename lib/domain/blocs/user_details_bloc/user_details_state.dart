part of 'user_details_bloc.dart';

@freezed
class UserDetailsState with _$UserDetailsState {
  const factory UserDetailsState.initial() = _Initial;
  const factory UserDetailsState.loading() = _Loading;
  const factory UserDetailsState.loaded({required UserUrlModel userUrlModel}) = _Data;
  const factory UserDetailsState.error(String errorMessage) = _Error;
}
