import 'package:firebase_project/resources/auth_method.dart';
import 'package:firebase_project/widgets/auth_tile.dart';
import 'package:firebase_project/widgets/colors.dart';
import 'package:firebase_project/widgets/custom_textField.dart';
import 'package:firebase_project/widgets/evaluated_button.dart';
import 'package:firebase_project/widgets/svg_image_view.dart';

import 'package:firebase_project/widgets/text_view.dart';
import 'package:firebase_project/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isloading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
  }

  void loginUser() async {
    setState(() {
      bool _isloading = true;
    });
    String res = await AuthMethods().loginUser(
        email: emailControler.text, password: passwordControler.text);

    if (res != "success") {
    } else {
      showSnapBar(res, context);
    }
    setState(() {
      bool _isloading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 100.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextView(
                    text: "EzFinder",
                    fontfamily: 'Blanka',
                    fontSize: 28,
                    textColor: appMainColor,
                  ),
                  SizedBox(
                    height: 170,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: emailControler,
                    keyboardType: TextInputType.text,
                    isobscureText: false,
                    obscurechracter: "*",
                    hintText: "Email Address",
                    suffixIcon: const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: passwordControler,
                    keyboardType: TextInputType.text,
                    isobscureText: false,
                    obscurechracter: "*",
                    hintText: "Password",
                    isSuffixShow: true,
                    suffixIcon: const Icon(CupertinoIcons.eye),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 240),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: appRedColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginUser();
                      } else {
                        print("please fill");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(350, 50),
                      backgroundColor: Color(0xFF012269),
                      shadowColor: Colors.transparent,
                    ),
                    child: _isloading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.0,
                            ),
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'Not a member?',
                          style: TextStyle(
                              color: Color(0xFF71727A),
                              fontFamily: "RedHatDisplayMedium",
                              fontSize: 15)),
                      TextSpan(
                          text: ' Sign Up',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "RedHatDisplayBold",
                              color: appMainColor)), // this is invisible
                    ]),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(),
                  ),
                  const SizedBox(height: 20),
                  const TextView(
                    text: "Or continue with",
                    fontSize: 15,
                    fontfamily: 'RedHatDisplayMedium',
                    textColor: Color(0xFF71727A),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AuthTile(),
                  SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: "Cookie Policy",
                        fontSize: 12,
                        textColor: appMainColor,
                        fontfamily: 'RowdiesRegular',
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      TextView(
                        text: "Privacy Policy",
                        fontfamily: 'RowdiesRegular',
                        fontSize: 12,
                        textColor: appMainColor,
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 4,
                      ),
                      TextView(
                        text: "Terms of service",
                        fontfamily: 'RowdiesRegular',
                        fontSize: 12,
                        textColor: appMainColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
