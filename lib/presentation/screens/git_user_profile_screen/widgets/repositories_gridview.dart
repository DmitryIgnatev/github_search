import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_search/domain/blocs/repositories_bloc/repositories_bloc.dart';
import 'package:github_search/domain/models/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_search/presentation/utils/date_time_service.dart';
import 'package:github_search/presentation/utils/number_servise.dart';

class RepositoriesGridView extends StatelessWidget {
  final User user;
  const RepositoriesGridView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return BlocBuilder<RepositoriesBloc, RepositoriesState>(
      builder: (context, state) {
        return state.when(
            initial: () => const SizedBox(),
            loading: () => const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            loaded: (repositories) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 4
                          : 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: repositories.length,
                  itemBuilder: (context, index) {
                    final repository = repositories[index];
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    repository.defaultBranch,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                                Text(
                                  repository.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          height: 0.8),
                                ),
                              ],
                            ),
                            Text(
                              repository.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(NumberSevice.formatNumber(
                                        repository.stargazersCount)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        height: 17,
                                        width: 17,
                                        child: SvgPicture.asset(
                                            'assets/icons/svg/fork.svg')),
                                    Text(NumberSevice.formatNumber(
                                        repository.forksCount)),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                "${localization!.language}: ${repository.language}"),
                            Text(
                              DateTimeService.formatIso8601ToCustom(
                                  repository.updatedAt),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 74, 74)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            error: (errorMessage) => Expanded(
                  child: Center(
                    child: Text(errorMessage),
                  ),
                ));
      },
    );
  }
}
