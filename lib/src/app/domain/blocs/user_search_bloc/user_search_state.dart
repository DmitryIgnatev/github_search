part of 'user_search_bloc.dart';

@freezed
class UserSearchState with _$UserSearchState {
  const factory UserSearchState.initial() = _Initial;
  const factory UserSearchState.loading() = _Loading;
  const factory UserSearchState.data({required UserSearch userSearch}) = _Data;
  const factory UserSearchState.error(String errorMessage) = _Error;
}
