import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
       text: 'Register',
       color: colorWhite,
       size: screenSize.width * (14 / 360),
       fontFamily: 'interSemiBold',
       weight: FontWeight.normal);
  }
}