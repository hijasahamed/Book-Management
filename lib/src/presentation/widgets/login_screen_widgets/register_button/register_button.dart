import 'package:book_management/router.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      child: InkWell(
        onTap: () => context.goNamed(AppRoute.books.name),
        child: Ink(
          height: screenSize.height/17,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: registerButtonColor,
            borderRadius: BorderRadius.circular(screenSize.width * (7 / 360))
          ),
          child: Center(
            child: TextWidget(text: 'Register', color: colorWhite, size: screenSize.width * (14 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}