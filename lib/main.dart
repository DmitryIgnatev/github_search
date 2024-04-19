import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:github_search/domain/blocs/user_search_bloc/user_search_bloc.dart';
import 'package:github_search/data/repository/user_git_repository.dart';
import 'package:github_search/presentation/screens/git_user_search_screen/git_user_search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("en"),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RepositoryProvider(
        create: (context) => UserGitRepository(),
        child: BlocProvider(
          create: (context) => UserSearchBloc(
            userGitRepository: context.read(),
          ),
          child: const GitUserSearchScreen(),
        ),
      ),
    );
  }
}
