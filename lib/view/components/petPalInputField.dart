import 'package:flutter/material.dart';

class PetPalInputField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;

  const PetPalInputField({
    required this.hintText,
    this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[150],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none),
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
