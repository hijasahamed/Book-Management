import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.width/18),
      child: Container(
        height: screenSize.height/17,
        width: screenSize.width,
        decoration: BoxDecoration(
          color: registerButtonColor,
          borderRadius: BorderRadius.circular(screenSize.width/45)
        ),
        child: Center(
          child: TextWidget(text: 'Register', color: colorWhite, size: screenSize.width/25, fontFamily: 'interSemiBold', weight: FontWeight.normal),
        ),
      ),
    );
  }
}