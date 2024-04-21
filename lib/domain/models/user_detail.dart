import 'dart:convert';

import 'package:github_search/domain/models/user.dart';
import 'package:github_search/domain/models/user_url_model.dart';

class UserDetail {
  User user;
  UserUrlModel userInfo;

  UserDetail({
    required this.user,
    required this.userInfo,
  });

  UserDetail copyWith({
    User? user,
    UserUrlModel? userInfo,
  }) {
    return UserDetail(
      user: user ?? this.user,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  factory UserDetail.fromMap(Map<String, dynamic> map) {
    return UserDetail(
      user: User.fromJson(map['user'] as Map<String, dynamic>),
      userInfo: UserUrlModel.fromMap(map['userInfo'] as Map<String, dynamic>),
    );
  }

  factory UserDetail.fromJson(String source) =>
      UserDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDetail(user: $user, userInfo: $userInfo)';

  @override
  bool operator ==(covariant UserDetail other) {
    if (identical(this, other)) return true;

    return other.user == user && other.userInfo == userInfo;
  }

  @override
  int get hashCode => user.hashCode ^ userInfo.hashCode;
}
