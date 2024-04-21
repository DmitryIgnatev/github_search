import 'dart:convert';

class UserUrlModel {
  int followers;
  String name;
  String company;
  String location;

  UserUrlModel({
    required this.followers,
    required this.name,
    required this.company,
    required this.location,
  });

  UserUrlModel copyWith({
    int? followers,
    String? name,
    String? company,
    String? location,
  }) {
    return UserUrlModel(
      followers: followers ?? this.followers,
      name: name ?? this.name,
      company: company ?? this.company,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'followers': followers,
      'name': name,
      'company': company,
      'location': location,
    };
  }

  factory UserUrlModel.fromMap(Map<String, dynamic> map) {
    return UserUrlModel(
      followers: map['followers'] ?? 0,
      name: map['name'] ?? '',
      company: map['company'] ?? '',
      location: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserUrlModel.fromJson(String source) =>
      UserUrlModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserUrlModel(followers: $followers, name: $name, company: $company, location: $location)';
  }

  @override
  bool operator ==(covariant UserUrlModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.followers == followers &&
      other.name == name &&
      other.company == company &&
      other.location == location;
  }

  @override
  int get hashCode {
    return followers.hashCode ^
      name.hashCode ^
      company.hashCode ^
      location.hashCode;
  }
}
