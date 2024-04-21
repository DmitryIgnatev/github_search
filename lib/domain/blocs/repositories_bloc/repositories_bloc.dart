import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_search/data/repository/user_git_repository.dart';
import 'package:github_search/domain/models/repository.dart';
import 'package:meta/meta.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final UserGitRepository _userGitRepository;
  RepositoriesBloc({required UserGitRepository userGitRepository})
      : _userGitRepository = userGitRepository,
        super(RepositoriesLoadingState()) {
    on<RepositoriesLoadEvent>(_onRepositoriesLoadEvent);
  }

  FutureOr<void> _onRepositoriesLoadEvent(
      RepositoriesLoadEvent event, Emitter<RepositoriesState> emit) async {
    try {
      emit(RepositoriesLoadingState());
      final repositories =
          await _userGitRepository.getUserRepositories(event.reposUrl);
      emit(RepositoriesLoadedState(repositories: repositories));
    } catch (e) {
      emit(RepositoriesErrorState(errorMessage: '$e'));
      throw Exception("Failed to load repositories $e");
    }
  }
}
