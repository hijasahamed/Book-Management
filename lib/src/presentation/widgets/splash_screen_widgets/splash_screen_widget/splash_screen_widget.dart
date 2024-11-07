import 'package:book_management/src/presentation/ui/splash_screen/splash_screen.dart';
import 'package:book_management/src/presentation/widgets/splash_screen_widgets/splash_screen_logo_image/splash_screen_logo_image.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    super.key,
    required this.widget,
  });

  final SplashScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: widget.screenSize.width,
      height: widget.screenSize.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF59504),
            Color(0xFFF56C04),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const SplashScreenLogoImage(),
    );
  }
}

