import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_search/data/repository/user_git_repository.dart';
import 'package:github_search/domain/models/repository.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';
part 'repositories_bloc.freezed.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final UserGitRepository _userGitRepository;
  RepositoriesBloc({required UserGitRepository userGitRepository})
      : _userGitRepository = userGitRepository,
        super(const _Initial()) {
    on<RepositoriesEvent>(_onRepositoriesLoadEvent);
  }

  FutureOr<void> _onRepositoriesLoadEvent(
      RepositoriesEvent event, Emitter<RepositoriesState> emit) async {
    try {
      emit(const RepositoriesState.loading());
      final repositories =
          await _userGitRepository.getUserRepositories(event.reposUrl);
      emit(RepositoriesState.loaded(repositories: repositories));
    } catch (e) {
      emit(RepositoriesState.error('$e'));
      throw Exception("Failed to load repositories $e");
    }
  }
}
