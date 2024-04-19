import 'package:flutter/material.dart';
import 'package:github_search/domain/models/user.dart';
import 'package:github_search/presentation/screens/git_user_profile_screen/git_user_profile_screen.dart';

class UserGitListTile extends StatelessWidget {
  const UserGitListTile({
    super.key,
    required this.userGit,
  });

  final User userGit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userGit.avatarUrl),
        ),
        title: Row(
          children: [
            Text(userGit.login),
            const SizedBox(
              width: 10,
            ),
            const Text('')
          ],
        ),
        subtitle: Text(userGit.htmlUrl),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GitUserProfileScreen(user: userGit),
          ));
        },
      ),
    );
  }
}
