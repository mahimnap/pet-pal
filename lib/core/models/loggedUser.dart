import 'package:flutter/material.dart';

class LoggedUser with ChangeNotifier {
  String email;
  String password;
  bool isLoggedIn = false;

  LoggedUser(
      {required this.email, required this.password, required this.isLoggedIn});

  void updateAccountDetails(String email, String password, bool loggedstatus) {
    this.email = email;
    this.password = password;
    isLoggedIn = loggedstatus;
    notifyListeners();
  }

  void updateLoggedStat(bool loggedstatus) {
    isLoggedIn = loggedstatus;
    notifyListeners();
  }
}
