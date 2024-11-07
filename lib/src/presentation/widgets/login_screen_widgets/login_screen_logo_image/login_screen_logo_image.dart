import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: SvgPicture.asset('assets/images/app logo.svg',height: screenSize.height/10,width: screenSize.height/10,),
      ),
    );
  }
}