import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_search/src/app/domain/models/user_search.dart';
import 'package:github_search/src/app/data/repository/user_git_repository.dart';

part 'user_search_event.dart';
part 'user_search_state.dart';
part 'user_search_bloc.freezed.dart';

class UserSearchBloc extends Bloc<UserSearchEvent, UserSearchState> {
  final UserGitRepository _userGitRepository;
  UserSearchBloc({required UserGitRepository userGitRepository})
      : _userGitRepository = userGitRepository,
        super(const _Initial()) {
    on<UserSearchEvent>(_searchUser);
  }

  FutureOr<void> _searchUser(
    UserSearchEvent event,
    Emitter<UserSearchState> emit,
  ) async {
    emit(const UserSearchState.loading());
    try {
      final userSearch = await _userGitRepository.getUsers(username:event.userId);
      emit(UserSearchState.data(userSearch: userSearch));
    } catch (e, s) {
      log('Fetching user error', error: e, stackTrace: s);
      emit(const UserSearchState.error('Fetching user error'));
    }
  }
}
