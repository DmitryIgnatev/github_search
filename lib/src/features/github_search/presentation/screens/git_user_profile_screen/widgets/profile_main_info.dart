import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/src/features/github_search/domain/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:github_search/src/features/github_search/domain/models/user.dart';
import 'package:github_search/src/features/github_search/presentation/utils/number_servise.dart';

class ProfileMainInfo extends StatelessWidget {
  final User user;
  const ProfileMainInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(45)),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.network(
                  user.avatarUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: state.when(
                initial: () => const SizedBox(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (errorMessage) => Center(
                  child: Text(errorMessage),
                ),
                loaded: (userUrlModel) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userUrlModel.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(userUrlModel.company,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(userUrlModel.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium),
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          NumberSevice.formatNumber(userUrlModel.followers),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
