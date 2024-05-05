import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/src/api/api.dart';
import 'package:github_search/src/features/github_search/data/api_exception.dart';
import 'package:github_search/src/features/github_search/data/repository/user_git_repository.dart';
import 'package:github_search/src/features/github_search/domain/models/user.dart';
import 'package:github_search/src/features/github_search/domain/models/user_search.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

const encodedUserSearchJsonResponse = """
{
  "total_count":1,
  "incomplete_results":false,
  "items":[
    {
      "login":"DmitryIgnatev",
      "id":106831531,
      "node_id":"U_kgDOBl4eqw",
      "avatar_url":"https://avatars.githubusercontent.com/u/106831531?v=4",
      "gravatar_id":"",
      "url":"https://api.github.com/users/DmitryIgnatev",
      "html_url":"https://github.com/DmitryIgnatev",
      "followers_url":"https://api.github.com/users/DmitryIgnatev/followers",
      "following_url":"https://api.github.com/users/DmitryIgnatev/following{/other_user}",
      "gists_url":"https://api.github.com/users/DmitryIgnatev/gists{/gist_id}",
      "starred_url":"https://api.github.com/users/DmitryIgnatev/starred{/owner}{/repo}",
      "subscriptions_url":"https://api.github.com/users/DmitryIgnatev/subscriptions",
      "organizations_url":"https://api.github.com/users/DmitryIgnatev/orgs",
      "repos_url":"https://api.github.com/users/DmitryIgnatev/repos",
      "events_url":"https://api.github.com/users/DmitryIgnatev/events{/privacy}",
      "received_events_url":"https://api.github.com/users/DmitryIgnatev/received_events",
      "type":"User",
      "site_admin":false,
      "score":1.0}
    ]
  }
""";

final expectedUserSearchFromJson = UserSearch(totalCount: 1, items: [
  User(
      login: 'DmitryIgnatev',
      id: 106831531,
      avatarUrl: 'https://avatars.githubusercontent.com/u/106831531?v=4',
      htmlUrl: 'https://github.com/DmitryIgnatev',
      url: 'https://api.github.com/users/DmitryIgnatev',
      reposUrl: 'https://api.github.com/users/DmitryIgnatev/repos')
]);

void main() {
  test('repository with mocked http client, success', () async {
    final mockHttpClient = MockHttpClient();
    final api = GitHubApi();
    final userGitRepository =
        UserGitRepository(api: api, client: mockHttpClient);
    when(() => mockHttpClient.get(api.users('DmitryIgnatev'))).thenAnswer(
        (_) => Future.value(http.Response(encodedUserSearchJsonResponse, 200)));
    final userSearch =
        await userGitRepository.getUsers(username: 'DmitryIgnatev');
    // expectations
    expect(userSearch, expectedUserSearchFromJson);
  });

  test('repository with mocked http client, failure', () async {
    final mockHttpClient = MockHttpClient();
    final api = GitHubApi();
    final userGitrepository =
        UserGitRepository(api: api, client: mockHttpClient);
    when(() => mockHttpClient.get(api.users('torvalds')))
        .thenAnswer((_) => Future.value(http.Response('{}', 401)));
    // expectations
    expect(() => userGitrepository.getUsers(username: 'torvalds'),
        throwsA(isA<APIException>()));
  });
}
