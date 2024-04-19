import 'dart:convert';
import 'dart:developer';

import 'package:github_search/domain/models/user.dart';
import 'package:http/http.dart' as http;

class UserGitRepository {
  Future<User> getUsers(String userId) async {
    try {
      final url = Uri.parse('https://api.github.com/search/users?q=$userId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return User.fromJson(json);
      } else {
        throw Exception('Fetching user error');
      }
    } catch (e, s) {
      log('Fetching user error', error: e, stackTrace: s);
      throw Exception('Fetching user error');
    }
  }
}
