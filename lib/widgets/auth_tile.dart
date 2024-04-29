import 'package:firebase_project/widgets/auth_circle.dart';
import 'package:flutter/material.dart';

class AuthTile extends StatelessWidget {
  const AuthTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthCircle(
            boxHeight: 50,
            boxWidth: 50,
            boxColor: Color(0xFF012269),
            svgPath: "assets/Email1.svg",
          ),
          SizedBox(
            width: 15,
          ),
          AuthCircle(
            boxHeight: 50,
            boxWidth: 50,
            boxColor: Color(0xFFED3241),
            svgPath: "assets/google1.svg",
          ),
          SizedBox(
            width: 15,
          ),
          AuthCircle(
            boxHeight: 50,
            boxWidth: 50,
            boxColor: Color(0xFF006FFD),
            svgPath: 'assets/facebook1.svg',
          ),
          SizedBox(
            width: 15,
          ),
          AuthCircle(
            boxHeight: 50,
            boxWidth: 50,
            boxColor: Color(0xFF1F2024),
            svgPath: 'assets/apple1.svg',
          ),
        ],
      ),
    );
  }
}
