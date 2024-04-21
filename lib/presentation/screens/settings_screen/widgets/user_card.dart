import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_search/constants/network_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCard extends StatelessWidget {
  final String clientId = 'YOUR_CLIENT_ID';
  final String clientSecret = 'YOUR_CLIENT_SECRET';
  final String redirectUrl = 'YOUR_CALLBACK_URL';
  const UserCard({super.key});

  get http => null;

  // URL для начала процесса авторизации
  void initiateGitHubLogin() async {
    final url = '${NetworkConstants.domainName}/login/oauth/authorize'
        '?client_id=$clientId'
        '&scope=repo user'
        '&redirect_uri=$redirectUrl';

    if (!await launchUrl(Uri(path: url))) {
      throw Exception('Could not launch ${Uri(path: url)}');
    }
  }

  // Функция для обмена кода на access token
  Future<String?> getAccessToken(String code) async {
    final response = await http.post(
      Uri.parse('${NetworkConstants.domainName}/login/oauth/access_token'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
        'redirect_uri': redirectUrl,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['access_token'];
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Container(
                height: 60,
                width: 60,
                color: Colors.grey,
                child: const Icon(
                  Icons.person,
                  size: 45,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: initiateGitHubLogin,
              child: Text(
                "Tap to authorize",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(height: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
