import 'package:flutter/material.dart';

class PetPalButtons extends StatelessWidget {
  final String buttonText;

  const PetPalButtons({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onPressedHandler,
        child: Text(buttonText),
      ),
    );
  }

  void _onPressedHandler() {}
}
