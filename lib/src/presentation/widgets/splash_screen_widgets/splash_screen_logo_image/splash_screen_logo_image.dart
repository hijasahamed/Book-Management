import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenLogoImage extends StatelessWidget {
  const SplashScreenLogoImage({
    super.key,
    required this.screenSize
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/images/app logo.svg',height: screenSize.height/10,width: screenSize.height/10,),
    );
  }
}