import 'package:flutter/foundation.dart';

import 'package:github_search/src/features/github_search/domain/models/user.dart';

class UserSearch {
  int totalCount;
  List<User> items;

  UserSearch({
    required this.totalCount,
    required this.items,
  });

  factory UserSearch.fromMap(Map<String, dynamic> json) {
    return UserSearch(
        totalCount: json['total_count'] ?? 0,
        items: List.from(json['items']).map((e) => User.fromMap(e)).toList());
  }

  @override
  bool operator ==(covariant UserSearch other) {
    if (identical(this, other)) return true;
  
    return 
      other.totalCount == totalCount &&
      listEquals(other.items, items);
  }

  @override
  int get hashCode => totalCount.hashCode ^ items.hashCode;
}
