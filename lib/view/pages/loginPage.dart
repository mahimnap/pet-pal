import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petpalui/main.dart';
import 'package:petpalui/view/pages/homePage.dart';
import 'package:petpalui/view/pages/signUpPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../core/services/utils.dart';
import "../../core/models/loggedUser.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignInAccount? _googleSignInAccount;
  User? _user;

  void login(final provider) async {
    final email = emailController.text;
    final password = passwordController.text;
    // add auth here

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        final user = _auth.currentUser;
        if (user != null) {
          // User is signed in, navigate to home screen
          provider.updateAccountDetails(email, password, true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Main(),
            ),
          );
        } else {
          showToast("Could not sign in with email and password");
        }
      } catch (error) {
        print(error);
        showToast("Could not sign in with email and password");
      }
    } else {
      showToast("Could not sign in with email and password");
    }
  }

  void _signupInstead() {
    Fluttertoast.showToast(
      msg: "Not implemented yet",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _signupInstead2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loggedUserProvider = context.read<LoggedUser>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Center(
              child: Text(
                "Pet Pal",
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            //SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => login(loggedUserProvider),
                child: Text("Login"),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: GestureDetector(
                onTap: _signupInstead2,
                child: Text(
                  "Sign Up Instead",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
