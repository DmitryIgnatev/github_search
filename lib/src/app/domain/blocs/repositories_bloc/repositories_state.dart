part of 'repositories_bloc.dart';

@freezed
class RepositoriesState with _$RepositoriesState {
  const factory RepositoriesState.initial() = _Initial;
  const factory RepositoriesState.loading() = _Loading;
  const factory RepositoriesState.loaded(
      {required List<Repository> repositories}) = _Data;
  const factory RepositoriesState.error(String errorMessage) = _Error;
}
