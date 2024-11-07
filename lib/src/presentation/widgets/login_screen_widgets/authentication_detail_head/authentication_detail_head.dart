import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationDetailHead extends StatelessWidget {
  const AuthenticationDetailHead({
    super.key,
    required this.screenSize,
    required this.title
  });

  final Size screenSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.width/75,top: screenSize.width/18),
      child: TextWidget(text: title, color: authDataTypeColor, size: screenSize.width/33, fontFamily: 'interRegular', weight: FontWeight.normal),
    );
  }
}