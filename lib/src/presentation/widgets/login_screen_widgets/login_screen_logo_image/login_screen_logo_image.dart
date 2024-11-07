import 'package:flutter/material.dart';

class LoginScreenLogoImage extends StatelessWidget {
  const LoginScreenLogoImage({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height/25,bottom: screenSize.height/11),
      child: Center(
        child: Container(
          height: screenSize.height/11,
          width: screenSize.height/11,
          decoration: BoxDecoration(
            border: Border.all(width: .1),
            borderRadius: BorderRadius.circular(screenSize.width/20),
            image: const DecorationImage(image: AssetImage('assets/images/Logo.png'),fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}