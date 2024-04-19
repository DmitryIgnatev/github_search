import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:github_search/domain/models/user_items.dart';

class GitUserProfileScreen extends StatefulWidget {
  final UserItems user;

  const GitUserProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<GitUserProfileScreen> createState() => _GitUserProfileScreenState();
}

class _GitUserProfileScreenState extends State<GitUserProfileScreen> {
  final browser = InAppBrowser();

  var options = InAppBrowserClassOptions(
    crossPlatform: InAppBrowserOptions(hideUrlBar: false),
    inAppWebViewGroupOptions: InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        javaScriptEnabled: true,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.user.login!),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.user.avatarUrl!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, color: Colors.indigo),
                    const SizedBox(width: 15),
                    Text(
                      widget.user.login!,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'ID: ${widget.user.id!}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    browser.openUrlRequest(
                      urlRequest: URLRequest(
                        url: Uri.parse(widget.user.htmlUrl!),
                      ),
                      options: options,
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.link, color: Colors.indigo),
                      const SizedBox(width: 15),
                      Text(widget.user.htmlUrl!),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
