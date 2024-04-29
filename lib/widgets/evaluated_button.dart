import 'package:flutter/material.dart';

class EvaluatedButton extends StatelessWidget {
  const EvaluatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: const Size(370, 50),
        backgroundColor: Color(0xFF012269),
        shadowColor: Colors.transparent,
      ),
      child: const Text(
        "Login",
        style: TextStyle(
            fontSize: 17,
            fontFamily: "RedHatDisplayBold",
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}
