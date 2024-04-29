import 'package:firebase_project/resources/auth_method.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/signup_view.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: const Size(350, 50),
        backgroundColor: Color(0xFF012269),
        shadowColor: Colors.transparent,
      ),
      child: const Text(
        "Confirm",
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
