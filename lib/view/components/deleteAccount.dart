import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petpalui/core/services/utils.dart';
import 'package:provider/provider.dart';
import "../../core/models/loggedUser.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void deleteAccount(provider) async {
  User? user = _auth.currentUser;
  if (user != null) {
    try {
      await user.delete();
      showToast('User account deleted');
      provider.updateAccountDetails("", "", false);
    } catch (e) {
      showToast('Failed to delete user account: $e');
    }
  }
}

class DeleteAccount extends StatefulWidget {
  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  @override
  Widget build(BuildContext context) {
    final loggedUserProvider = context.read<LoggedUser>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Delete Account"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Are you sure you want to delete your account?",
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () => deleteAccount(loggedUserProvider),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: Size(double.infinity, 50.0),
              ),
              child: Text(
                "Confirm Deletion",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
