import 'package:book_management/router.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/snackbar_widget.dart';
import 'package:book_management/src/presentation/widgets/splash_screen_widgets/splash_screen_widget/splash_screen_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.screenSize
  });
  final Size screenSize;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF59504),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFFF56C04),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenWidget(widget: widget),
    );
  }
  Future<void> checkLogin()async{
    var connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.none){
      if(mounted){
        snackbarMessageWidget(text: 'Network Connection Lost', context: context, color: colorWhite, textColor: colorRed, behavior: SnackBarBehavior.fixed, time: 5000);
      }
    }
    else{
      await Future.delayed(const Duration(milliseconds: 1800));
      if(mounted){
        context.goNamed(AppRoute.login.name);
      }
    }
  }
}