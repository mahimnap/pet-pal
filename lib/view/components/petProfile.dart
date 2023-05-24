import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PetProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pet Profile"),
      ),
      body: Center(
        child: Text("Implement Pet Profile"),
      )
    );
  }
}
