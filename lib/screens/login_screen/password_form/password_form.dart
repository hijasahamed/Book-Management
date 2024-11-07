import 'package:book_management/screens/login_screen/authentication_detail_head/authentication_detail_head.dart';
import 'package:book_management/screens/login_screen/login_screen.dart';
import 'package:book_management/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthenticationDetailHead(screenSize: screenSize,title: 'Password',),
        CustomTextFormField(
          hintText: 'Enter your password', 
          obscureText: false, 
          keyboardType: TextInputType.name, 
          screenSize: screenSize, 
          controller: passwordController,
          textCapitalization: TextCapitalization.none,
        ),
      ],
    );
  }
}