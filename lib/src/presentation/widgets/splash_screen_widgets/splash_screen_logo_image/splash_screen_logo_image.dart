import 'package:flutter/material.dart';

class SplashScreenLogoImage extends StatelessWidget {
  const SplashScreenLogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/Logo.png'),
    );
  }
}