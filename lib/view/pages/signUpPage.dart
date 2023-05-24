import 'package:flutter/material.dart';

import '../components/petPalButtons.dart';
import '../components/petPalInputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/services/utils.dart';
import 'package:petpalui/main.dart';
import "../../core/models/loggedUser.dart";
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      showToast('User signed up for ${_emailController.text}');
      // Navigate to home page or perform any other desired action
      final loggedUserProvider = context.read<LoggedUser>();
      loggedUserProvider.updateLoggedStat(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Main(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      }
    } catch (e) {
      showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: signUp,
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 20),
              Text("or"),
              PetPalButtons(buttonText: "Login with Google"),
              PetPalButtons(buttonText: "Login with Apple"),
              PetPalButtons(buttonText: "Login with Email"),
            ],
          ),
        ),
      ),
    );
  }
}
