import 'package:flutter/material.dart';
import 'package:github_search/domain/models/user_items.dart';
import 'package:github_search/presentation/screens/git_user_profile_screen/git_user_profile_screen.dart';

class UserGitListTile extends StatelessWidget {
  const UserGitListTile({
    super.key,
    required this.userGit,
  });

  final UserItems userGit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userGit.avatarUrl!),
        ),
        title: Text(userGit.login!),
        subtitle: Text(userGit.htmlUrl!),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GitUserProfileScreen(user: userGit),
          ));
        },
      ),
    );
  }
}