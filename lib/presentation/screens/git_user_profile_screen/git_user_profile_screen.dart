import 'package:flutter/material.dart';
import 'package:github_search/domain/models/user.dart';
import 'package:github_search/presentation/screens/git_user_profile_screen/widgets/profile_main_info.dart';

class GitUserProfileScreen extends StatefulWidget {
  final User user;

  const GitUserProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<GitUserProfileScreen> createState() => _GitUserProfileScreenState();
}

class _GitUserProfileScreenState extends State<GitUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.user.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileMainInfo(
              user: widget.user,
            )
          ],
        ),
      ),
    );
  }
}
