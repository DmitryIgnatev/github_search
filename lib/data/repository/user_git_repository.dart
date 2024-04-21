import 'dart:convert';
import 'dart:developer';

import 'package:github_search/domain/models/repository.dart';

import 'package:github_search/domain/models/user_search.dart';
import 'package:github_search/domain/models/user_url_model.dart';
import 'package:http/http.dart' as http;

class UserGitRepository {
  /// one method for fetching all data from API
  Future<dynamic> _fetchData(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e, s) {
      log('Error fetching data', error: e, stackTrace: s);
      throw Exception('Error fetching data');
    }
  }

  /// get/find users
  Future<UserSearch> getUsers(String userId) async {
    final json =
        await _fetchData('https://api.github.com/search/users?q=$userId');
    return UserSearch.fromMap(json);
  }

  /// get user repositories
  Future<List<Repository>> getUserRepositories(String reposUrl) async {
    final json = await _fetchData(reposUrl);
    List<Repository> repositories = [];
    for (var element in json) {
      repositories.add(Repository.fromMap(element));
    }
    return repositories;
  }

  /// get info from UserUrl
  Future<UserUrlModel> getUserInfo(String userUrl) async {
    final json = await _fetchData(userUrl);
    return UserUrlModel.fromMap(json);
  }
}
