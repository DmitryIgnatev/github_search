import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/domain/blocs/repositories_bloc/repositories_bloc.dart';
import 'package:github_search/domain/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:github_search/domain/models/user.dart';
import 'package:github_search/presentation/screens/git_user_profile_screen/widgets/profile_main_info.dart';
import 'package:github_search/presentation/screens/git_user_profile_screen/widgets/repositories_gridview.dart';

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
  void initState() {
    context
        .read<RepositoriesBloc>()
        .add(RepositoriesEvent.load(reposUrl: widget.user.reposUrl));
    context
        .read<UserDetailsBloc>()
        .add(UserDetailsEvent.load(userUrl: widget.user.url));
    super.initState();
  }

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
            ),
            const SizedBox(
              height: 10,
            ),
            RepositoriesGridView(user: widget.user)
          ],
        ),
      ),
    );
  }
}
