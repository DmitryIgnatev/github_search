import 'package:flutter/material.dart';
import 'package:github_search/domain/models/user.dart';

class ProfileMainInfo extends StatefulWidget {
  final User user;
  const ProfileMainInfo({super.key, required this.user});

  @override
  State<ProfileMainInfo> createState() => _ProfileMainInfoState();
}

class _ProfileMainInfoState extends State<ProfileMainInfo> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(45)),
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.network(
              widget.user.avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.person, color: Colors.indigo),
                  const SizedBox(width: 15),
                  Text(
                    widget.user.login,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                'ID: ${widget.user.id}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 15),
              
            ],
          ),
        ),
      ],
    );
  }
}
