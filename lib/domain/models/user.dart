class User {
  String login;
  int id;
  String avatarUrl;
  String htmlUrl;
  String url;
  String reposUrl;

  User(
      {required this.login,
      required this.id,
      required this.avatarUrl,
      required this.htmlUrl,
      required this.url,
      required this.reposUrl});

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      login: json['login'] ?? '',
      id: json['id'] ?? 0,
      avatarUrl: json['avatar_url'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      url: json['url'] ?? '',
      reposUrl: json['repos_url'] ?? '',
    );
  }
}
