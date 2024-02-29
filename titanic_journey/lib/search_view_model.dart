import 'package:flutter/material.dart';
import 'package:titanic_journey/users.dart';

/// A view model for the search functionality.
final class SearchViewModel extends ChangeNotifier {
  final List<Users> _users = UsersModelList.users;
  List<Users> _searchResults = [];

  /// The list of search results.
  List<Users> get searchResults => _searchResults;

  /// Searches for users whose name or surname contains the given query.
  void search(String query) {
    _searchResults = _users
        .where(
          (user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) ||
              user.surname.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }
}
