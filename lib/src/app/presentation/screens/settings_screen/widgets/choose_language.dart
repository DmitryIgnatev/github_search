import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:github_search/src/app/domain/blocs/locale_bloc/locale_bloc.dart';
import 'package:github_search/src/app/domain/models/app_localization.dart';
import 'package:github_search/src/global/l10n/localization_helper.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationHelper.getLocalizations(context);
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        AppLanguage selectedLanguage =
            AppLocalization.appLanguage(state.locale);
        List<AppLanguage> languages = AppLanguage.values;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              localization.language,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  return DropdownButton(
                      onChanged: (language) {
                        if (language != null) {
                          context
                              .read<LocaleBloc>()
                              .add(LocaleChangeEvent(locale: language.locale));
                        }
                      },
                      items: languages
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: SizedBox(
                                  width: 40,
                                  height: 25,
                                  child: Image.asset(
                                    AppLocalization.languageFlagPath(item),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedLanguage);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
