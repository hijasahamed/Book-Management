import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Size screenSize;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool isPasswordForm;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.screenSize,
    required this.controller,
    required this.textCapitalization,
    required this.obscureText,
    required this.isPasswordForm
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: colorWhite,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenSize.width * (9 / 360)),
        borderSide: const BorderSide(
          color:  Color(0xFFE6E6E6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenSize.width * (9 / 360)),
        borderSide: const BorderSide(
          color: Color(0XFFF56C04),
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.all(Radius.circular(screenSize.width * (9 / 360)))
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: screenSize.height / 60,
        horizontal: screenSize.width / 25,
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: hintTextColor,fontSize: screenSize.width * (15 / 360),fontFamily: 'interRegular'),
      suffixIcon:  isPasswordForm
      ? IconButton(
        onPressed: () {
          
        }, 
        icon: Icon(obscureText? Icons.visibility : Icons.visibility_off)
      )
      : null    
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