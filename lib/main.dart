//import 'package:ezfinder_app/Login_View.dart';

import 'package:firebase_project/login_view.dart';
import 'package:firebase_project/signup_view.dart';
//import 'package:ezfinder_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xFF012269),
      home: LoginView(),
    );
  }
}
