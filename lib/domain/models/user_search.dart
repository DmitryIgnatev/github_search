import 'package:github_search/domain/models/user.dart';

class UserSearch {
  int totalCount;
  List<User> items;

  UserSearch({
    required this.totalCount,
    required this.items,
  });

  factory UserSearch.fromJson(Map<String, dynamic> json) {
    return UserSearch(
        totalCount: json['total_count'] ?? 0,
        items: List.from(json['items']).map((e) => User.fromJson(e)).toList());
  }
}
