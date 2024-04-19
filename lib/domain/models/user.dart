import 'package:github_search/domain/models/user_items.dart';

class User {
  int? totalCount;
  bool? incompleteResults;
  List<UserItems>? items;

  User({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  @override
  String toString() =>
      'User(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';

  User.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    items = List.from(json['items']).map((e) => UserItems.fromJson(e)).toList();
  }
}
