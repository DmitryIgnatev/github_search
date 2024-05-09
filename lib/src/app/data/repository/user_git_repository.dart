import 'dart:convert';
import 'dart:io';

import 'package:github_search/src/app/data/api_exception.dart';
import 'package:http/http.dart' as http;

import 'package:github_search/src/app/domain/models/repository.dart';
import 'package:github_search/src/app/domain/models/user_search.dart';
import 'package:github_search/src/app/domain/models/user_url_model.dart';
import 'package:github_search/src/api/api.dart';

class UserGitRepository {
  final http.Client client;
  final GitHubApi api;

  UserGitRepository({
    required this.client,
    required this.api,
  });

  /// one method for fetching all data from API
  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        default:
          throw UnknownException();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }

  /// get/find users
  Future<UserSearch> getUsers({required String username}) => _getData(
        uri: api.users(username),
        builder: (data) => UserSearch.fromMap(data),
      );

  /// get user repositories
  Future<List<Repository>> getUserRepositories({required String reposUrl}) =>
      _getData(
          uri: api.repositories(reposUrl),
          builder: (data) {
            List<Repository> repositories = [];
            for (var element in data) {
              repositories.add(Repository.fromMap(element));
            }
            return repositories;
          });

  /// get info from UserUrl
  Future<UserUrlModel> getUserInfo({required String userUrl}) => _getData(
      uri: api.userInfo(userUrl),
      builder: ((data) => UserUrlModel.fromMap(data)));
}
