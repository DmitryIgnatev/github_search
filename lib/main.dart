import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/src/features/github_search/domain/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:github_search/src/features/github_search/domain/blocs/locale_bloc/locale_bloc.dart';
import 'package:github_search/src/features/github_search/domain/blocs/user_search_bloc/user_search_bloc.dart';
import 'package:github_search/src/features/github_search/data/repository/user_git_repository.dart';
import 'package:github_search/src/features/github_search/presentation/screens/git_user_search_screen/git_user_search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_search/src/api/api.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderContainer(
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          context.read<LocaleBloc>().add(const LocaleLoadEvent());
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const UserGitSearchView());
        },
      ),
    );
  }
}

class ProviderContainer extends StatelessWidget {
  final Widget child;
  const ProviderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              UserGitRepository(api: GitHubApi(), client: http.Client()),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => UserSearchBloc(
            userGitRepository: context.read(),
          ),
        ),
        BlocProvider<LocaleBloc>(
          create: (context) => LocaleBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
      ], child: child),
    );
  }
}
