import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword(BuildContext context) async {
    // String currentPassword = _currentPasswordController.text.trim();
    // String newPassword = _newPasswordController.text.trim();
    // String confirmPassword = _confirmPasswordController.text.trim();

    // if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
    //   Fluttertoast.showToast(
    //     msg: "Please fill in all fields.",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0,
    //   );
    // } else if (newPassword != confirmPassword) {
    //   Fluttertoast.showToast(
    //     msg: "New password and confirm password do not match.",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0,
    //   );
    // } else {
    //   Fluttertoast.showToast(
    //     msg: "Not Implemented Yet.",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0,
    //   );
    // }
    final currentUserEmail = FirebaseAuth.instance.currentUser?.email;
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (currentUserEmail != null) {
      await auth.sendPasswordResetEmail(email: currentUserEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reset Password"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextFormField(
            //   controller: _currentPasswordController,
            //   decoration: InputDecoration(
            //     labelText: "Current Password",
            //     border: OutlineInputBorder(),
            //   ),
            //   obscureText: true,
            // ),
            // SizedBox(height: 16.0),
            // TextFormField(
            //   controller: _newPasswordController,
            //   decoration: InputDecoration(
            //     labelText: "New Password",
            //     border: OutlineInputBorder(),
            //   ),
            //   obscureText: true,
            // ),
            // SizedBox(height: 16.0),
            // TextFormField(
            //   controller: _confirmPasswordController,
            //   decoration: InputDecoration(
            //     labelText: "Confirm New Password",
            //     border: OutlineInputBorder(),
            //   ),
            //   obscureText: true,
            // ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _changePassword(context),
                child: Text("Send Password Reset Link To Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
