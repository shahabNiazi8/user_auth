import 'package:flutter/material.dart';

class OtpButton extends StatelessWidget {
  const OtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        fixedSize: const Size(350, 60),
        backgroundColor: Color(0xFF012269),
        shadowColor: Colors.transparent,
      ),
      child: const Text(
        "Continue",
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
