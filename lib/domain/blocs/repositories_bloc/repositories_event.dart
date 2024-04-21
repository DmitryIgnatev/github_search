part of 'repositories_bloc.dart';

@freezed
class RepositoriesEvent with _$RepositoriesEvent {
  const factory RepositoriesEvent.load({required String reposUrl}) = _Load;
}