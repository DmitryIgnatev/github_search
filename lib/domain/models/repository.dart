import 'dart:convert';

class Repository {
  String name;
  String description;
  int forksCount;
  int stargazersCount;
  String language;
  String updatedAt;
  String defaultBranch;
  
  Repository({
    required this.name,
    required this.description,
    required this.forksCount,
    required this.stargazersCount,
    required this.language,
    required this.updatedAt,
    required this.defaultBranch,
  });

  Repository copyWith({
    String? name,
    String? description,
    int? forksCount,
    int? stargazersCount,
    String? language,
    String? updatedAt,
    String? defaultBranch,
  }) {
    return Repository(
      name: name ?? this.name,
      description: description ?? this.description,
      forksCount: forksCount ?? this.forksCount,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      language: language ?? this.language,
      updatedAt: updatedAt ?? this.updatedAt,
      defaultBranch: defaultBranch ?? this.defaultBranch,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'forksCount': forksCount,
      'stargazersCount': stargazersCount,
      'language': language,
      'updatedAt': updatedAt,
      'defaultBranch': defaultBranch,
    };
  }

  factory Repository.fromMap(Map<String, dynamic> map) {
    return Repository(
      name: map['name'] as String,
      description: map['description'] as String,
      forksCount: map['forksCount'] as int,
      stargazersCount: map['stargazersCount'] as int,
      language: map['language'] as String,
      updatedAt: map['updatedAt'] as String,
      defaultBranch: map['defaultBranch'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Repository.fromJson(String source) =>
      Repository.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Repository other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.forksCount == forksCount &&
        other.stargazersCount == stargazersCount &&
        other.language == language &&
        other.updatedAt == updatedAt &&
        other.defaultBranch == defaultBranch;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        forksCount.hashCode ^
        stargazersCount.hashCode ^
        language.hashCode ^
        updatedAt.hashCode ^
        defaultBranch.hashCode;
  }
}
