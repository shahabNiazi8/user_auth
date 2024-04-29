import 'dart:typed_data';

import 'package:firebase_project/resources/auth_method.dart';
import 'package:firebase_project/widgets/colors.dart';
import 'package:firebase_project/widgets/custom_textField.dart';
import 'package:firebase_project/widgets/text_view.dart';
import 'package:firebase_project/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class signupView extends StatefulWidget {
  const signupView({super.key});

  @override
  State<signupView> createState() => _signupViewState();
}

class _signupViewState extends State<signupView> {
  final nameController = TextEditingController();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final confirmpasswordControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Uint8List? _image;
  bool _isloading = false;

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().signUpUser(
        user: nameController.text,
        email: emailControler.text,
        password: passwordControler.text,
        confirmpassword: confirmpasswordControler.text,
        file: _image!);

    if (res != 'sucess') {
      showSnapBar(res, context);
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    nameController.dispose();
    confirmpasswordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://i1.rgstatic.net/ii/profile.image/1142222359674881-1649338440466_Q512/Ab-Cd-120.jpg'),
                          ),
                    IconButton(
                      padding: EdgeInsets.only(
                        left: 100,
                      ),
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 288),
                      child: TextView(
                        text: "Name",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontfamily: 'RowdiesMedium',
                        textColor: Color(0xFF1F2024),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      isobscureText: false,
                      obscurechracter: "*",
                      hintText: "your name",
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 223),
                      child: TextView(
                        text: "Email Address",
                        fontfamily: 'RowdiesMedium',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textColor: Color(0xFF1F2024),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: emailControler,
                      keyboardType: TextInputType.text,
                      isobscureText: false,
                      obscurechracter: "*",
                      hintText: "name@email.com",
                      isSuffixShow: true,
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 254),
                      child: TextView(
                        text: "Password",
                        fontfamily: 'RowdiesMedium',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textColor: Color(0xFF1F2024),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: passwordControler,
                      keyboardType: TextInputType.text,
                      isobscureText: false,
                      obscurechracter: "*",
                      hintText: "Create a Password",
                      isSuffixShow: true,
                      suffixIcon: const Icon(CupertinoIcons.eye_slash),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 195),
                      child: TextView(
                        text: "Confirm Password",
                        fontfamily: 'RowdiesMedium',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textColor: Color(0xFF1F2024),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: confirmpasswordControler,
                      keyboardType: TextInputType.text,
                      isobscureText: false,
                      obscurechracter: "*",
                      hintText: "Confirm Password",
                      isSuffixShow: true,
                      suffixIcon: const Icon(CupertinoIcons.eye_slash),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) => false,
                        ),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: 'I have read and agree with the ',
                                  style: TextStyle(
                                    fontFamily: "RedHatDisplayRegular",
                                    color: appGreyColor,
                                  )),
                              TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                      fontFamily: "RedHatDisplayBold",
                                      color: appMainColor)),
                              TextSpan(
                                  text: ' and the ',
                                  style: TextStyle(
                                      color: appGreyColor,
                                      fontFamily: "RedHatDisplayRegular")),
                              TextSpan(
                                  text: 'Privacy Policy.',
                                  style: TextStyle(
                                      color: appMainColor,
                                      fontFamily: "RedHatDisplayBold"))
                            ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          signUpUser();
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
                                strokeWidth: 2.0,
                              ),
                            )
                          : Text(
                              "Confirm",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
