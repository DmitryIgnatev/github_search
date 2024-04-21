part of 'repositories_bloc.dart';

@immutable
sealed class RepositoriesState extends Equatable {
  const RepositoriesState();

  @override
  List<Object?> get props => [];
}

class RepositoriesLoadingState extends RepositoriesState {}

class RepositoriesLoadedState extends RepositoriesState {
  final List<Repository> repositories;

  const RepositoriesLoadedState({required this.repositories});

  RepositoriesState copyWith({List<Repository>? repositories}) {
    return RepositoriesLoadedState(
      repositories: repositories ?? this.repositories,
    );
  }

  @override
  List<Object?> get props => [repositories];
}

class RepositoriesErrorState extends RepositoriesState {
  final String errorMessage;

  const RepositoriesErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}