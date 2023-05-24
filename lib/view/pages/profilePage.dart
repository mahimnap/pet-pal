import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petpalui/view/components/changeEmail.dart';
import 'package:petpalui/view/components/changePassword.dart';
import 'package:petpalui/view/components/deleteAccount.dart';
import 'package:petpalui/view/pages/loginPage.dart';
import '../../core/services/utils.dart';
import "../../core/models/loggedUser.dart";
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  void _logout(BuildContext context) {
    final loggedUserProvider = context.read<LoggedUser>();
    loggedUserProvider.updateLoggedStat(false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
    showToast("Logged out successfully!");
  }

  void _goToChangeEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeEmail(),
      ),
    );
  }

  void _goToChangePassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangePassword(),
      ),
    );
  }

  void _goToDeleteAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeleteAccount(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _goToChangeEmail(context),
                  child: Text("Change Email"),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _goToChangePassword(context),
                  child: Text("Reset Password"),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _goToDeleteAccount(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text("Delete Account"),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _logout(context),
                  child: Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
