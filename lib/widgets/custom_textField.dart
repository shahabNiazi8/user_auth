import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isobscureText;
  final String obscurechracter;
  final String hintText;
  final bool isSuffixShow;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.isobscureText,
    required this.obscurechracter,
    required this.hintText,
    this.isSuffixShow = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isobscureText,
      style: const TextStyle(),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "";
        }
        return null;
      },
      obscuringCharacter: obscurechracter,
      decoration: fieldDecoration(height, width, isSuffixShow),
    );
  }

  InputDecoration fieldDecoration(
      double height, double width, bool isSuffixShoww) {
    return isSuffixShoww
        ? InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              maxHeight: height * 0.060,
              minHeight: height * 0.060,
              maxWidth: width * 0.84,
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: TextStyle(height: 0),
            hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0xFF8F9098)),
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: textFieldBorder(
              Colors.black,
            ),
            enabledBorder: textFieldBorder(
              Color(0xFFC5C6CC),
            ),
          )
        : InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              maxHeight: height * 0.060,
              minHeight: height * 0.060,
              maxWidth: width * 0.84,
            ),
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xFF8F9098),
            ),
            hintText: hintText,
            errorStyle: TextStyle(height: 0),
            border: textFieldBorder(
              Colors.black,
            ),
            enabledBorder: textFieldBorder(
              Color(0xFFC5C6CC),
            ),
          );
  }

  OutlineInputBorder textFieldBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );
  }
}
