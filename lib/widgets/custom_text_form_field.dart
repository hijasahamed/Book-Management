import 'package:book_management/widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Size screenSize;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    required this.screenSize,
    required this.controller,
    required this.textCapitalization
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: colorWhite,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenSize.width/45),
        borderSide: const BorderSide(
          color:  Color(0xFFE6E6E6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenSize.width/45),
        borderSide: const BorderSide(
          color: Color(0XFFF56C04),
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.all(Radius.circular(screenSize.width/45))
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: screenSize.height / 60,
        horizontal: screenSize.width / 25,
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: hintTextColor,fontSize: screenSize.width/27,fontFamily: 'interRegular')     
    );

    return TextFormField(
      controller: controller,
      decoration: inputDecoration,
      textCapitalization: textCapitalization,
      style: const TextStyle(color: Color(0XFF1D1D1F)),
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}