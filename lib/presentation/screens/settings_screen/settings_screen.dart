import 'package:flutter/material.dart';
import 'package:github_search/presentation/screens/settings_screen/widgets/choose_language.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Column(
          children: [ChooseLanguage()],
        )),
      ),
    );
  }
}
