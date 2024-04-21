import 'dart:convert';

class UserUrlModel {
  int followers;
  String name;

  UserUrlModel({
    required this.followers,
    required this.name,
  });

  UserUrlModel copyWith({
    int? followers,
    String? name,
  }) {
    return UserUrlModel(
      followers: followers ?? this.followers,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'followers': followers,
      'name': name,
    };
  }

  factory UserUrlModel.fromMap(Map<String, dynamic> map) {
    return UserUrlModel(
      followers: map['followers'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserUrlModel.fromJson(String source) =>
      UserUrlModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserUrlModel(followers: $followers, name: $name)';

  @override
  bool operator ==(covariant UserUrlModel other) {
    if (identical(this, other)) return true;

    return other.followers == followers && other.name == name;
  }

  @override
  int get hashCode => followers.hashCode ^ name.hashCode;
}
