import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/domain/blocs/user_search_bloc/user_search_bloc.dart';
import 'package:github_search/presentation/screens/git_user_search_screen/widgets/user_git_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserGitSearchView extends StatefulWidget {
  const UserGitSearchView({super.key});

  @override
  State<UserGitSearchView> createState() => _UserGitSearchViewState();
}

class _UserGitSearchViewState extends State<UserGitSearchView> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localization!.app_name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.find_user_on_github,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _userController,
                      decoration: InputDecoration(
                        hintText: localization.enter_a_nickname,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return localization.there_is_no_such_user;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        final validate =
                            _formKey.currentState?.validate() ?? false;
                        if (!validate) {
                          return;
                        }
                        context.read<UserSearchBloc>().add(
                              UserSearchEvent.search(
                                userId: _userController.text,
                              ),
                            );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: Text(localization.search),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<UserSearchBloc, UserSearchState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      data: (user) {
                        final users = user.items;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: users.length,
                          controller: ScrollController(keepScrollOffset: true),
                          itemBuilder: (context, index) {
                            final userGit = users[index];
                            return UserGitListTile(userGit: userGit);
                          },
                        );
                      },
                      error: (errorMessage) => Center(
                        child: Text(errorMessage),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
