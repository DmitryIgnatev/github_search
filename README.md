# GitHub Search

The application requests the GitHub public search API. This application makes a filter by username, returning the users found in the search. When you click on a user, the application opens a new screen with additional information about the selected user, as well as the public repositories of this user. The application also supports localization in 2 languages: Russian and English.

### GitHub REST API documentation

https://docs.github.com/en/rest

### Technology stack
- state management: `bloc + freezed`
- persistence `shared_preferences`
- localization: `intl + flutter_localizations`
- network: `http`

### An example of how it works

[Users/dmitryignatev/Downloads/github%20seacrh.mp4](https://github.com/DmitryIgnatev/github_search/assets/106831531/b5c25da5-8d86-46ae-a0d6-67485d8f2901)
