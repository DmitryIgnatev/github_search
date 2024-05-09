/// Uri builder class for the API
class GitHubApi {
  static const String _apiBaseUrl = "https://api.github.com";

  Uri users(String userId) => _buildUri(
        path: "$_apiBaseUrl/search/users?q=$userId",
      );

  Uri repositories(String reposUrl) => _buildUri(
        path: reposUrl,
      );
  Uri userInfo(String userUrl) => _buildUri(
        path: userUrl,
      );

  Uri _buildUri({
    required String path,
  }) {
    return Uri.parse(
      path,
    );
  }
}
