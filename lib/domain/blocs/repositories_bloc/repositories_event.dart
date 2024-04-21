part of 'repositories_bloc.dart';

@immutable
sealed class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();

  @override
  List<Object?> get props => [];
}

class RepositoriesLoadEvent extends RepositoriesEvent {
  final String reposUrl;

  const RepositoriesLoadEvent({required this.reposUrl});
}
