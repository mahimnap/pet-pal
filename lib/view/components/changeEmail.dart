import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/services/utils.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  late TextEditingController _currentEmailController;
  late TextEditingController _newEmailController;
  late TextEditingController _confirmEmailController;

  @override
  void initState() {
    super.initState();
    _currentEmailController = TextEditingController();
    _newEmailController = TextEditingController();
    _confirmEmailController = TextEditingController();
  }

  @override
  void dispose() {
    _currentEmailController.dispose();
    _newEmailController.dispose();
    _confirmEmailController.dispose();
    super.dispose();
  }

  void _changeEmail(BuildContext context) {
    String currentEmail = _currentEmailController.text.trim();
    String newEmail = _newEmailController.text.trim();
    String confirmEmail = _confirmEmailController.text.trim();

    if (currentEmail.isEmpty || newEmail.isEmpty || confirmEmail.isEmpty) {
      showToast("Please fill in all fields.");
    } else if (newEmail != confirmEmail) {
      showToast("New email and confirm email do not match.");
    } else {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        user.updateEmail(newEmail).then((_) {
          showToast("Email changed successfully!");
        }).catchError((error) {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Change Email"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _currentEmailController,
              decoration: InputDecoration(
                labelText: "Current Email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _newEmailController,
              decoration: InputDecoration(
                labelText: "New Email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _confirmEmailController,
              decoration: InputDecoration(
                labelText: "Confirm New Email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _changeEmail(context),
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
