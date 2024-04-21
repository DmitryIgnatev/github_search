import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_search/data/repository/user_git_repository.dart';
import 'package:github_search/domain/models/user_url_model.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';
part 'user_details_bloc.freezed.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserGitRepository _userGitRepository;
  UserDetailsBloc({required UserGitRepository userGitRepository})
      : _userGitRepository = userGitRepository,
        super(const _Initial()) {
    on<UserDetailsEvent>(_onUserDetailsLoadEvent);
  }

  FutureOr<void> _onUserDetailsLoadEvent(
      UserDetailsEvent event, Emitter<UserDetailsState> emit) async {
    try {
      emit(const UserDetailsState.loading());
      final userUrlModel = await _userGitRepository.getUserInfo(event.userUrl);
      emit(UserDetailsState.loaded(userUrlModel: userUrlModel));
    } catch (e) {
      emit(UserDetailsState.error('$e'));
      throw Exception("Failed to load user details $e");
    }
  }
}
