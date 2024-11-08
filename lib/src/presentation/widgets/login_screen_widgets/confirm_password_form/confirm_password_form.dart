import 'package:book_management/src/presentation/widgets/login_screen_widgets/authentication_detail_head/authentication_detail_head.dart';
import 'package:book_management/src/presentation/ui/login_screen/login_screen.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordForm extends StatelessWidget {
  const ConfirmPasswordForm({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthenticationDetailHead(screenSize: screenSize,title: 'Confirm Password',),
        CustomTextFormField(
          hintText: 'Confirm your password', 
          keyboardType: TextInputType.text, 
          screenSize: screenSize, 
          controller: confirmPasswordController,
          textCapitalization: TextCapitalization.none,
          obscureText: true,
          isPasswordForm: true,
        ),
      ],
    );
  }
}