import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/domain/blocs/locale_bloc/locale_bloc.dart';
import 'package:github_search/domain/blocs/user_search_bloc/user_search_bloc.dart';
import 'package:github_search/data/repository/user_git_repository.dart';
import 'package:github_search/presentation/screens/git_user_search_screen/git_user_search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserGitRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserSearchBloc(
              userGitRepository: context.read(),
            ),
          ),
          BlocProvider<LocaleBloc>(
            create: (context) => LocaleBloc(),
          ),
        ],
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
      ),
    );
  }
}
