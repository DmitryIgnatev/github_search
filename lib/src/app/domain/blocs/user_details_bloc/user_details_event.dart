part of 'user_details_bloc.dart';

@freezed
class UserDetailsEvent with _$UserDetailsEvent {
  const factory UserDetailsEvent.load({required String userUrl}) = _Load;
}
