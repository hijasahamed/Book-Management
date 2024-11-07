import 'package:book_management/screens/login_screen/login_screen.dart';
import 'package:book_management/widgets/colors.dart';
import 'package:book_management/widgets/snackbar_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

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
    checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: Image.asset('assets/images/Logo.png'),
        ),
      ),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return LoginScreen();
        },));
      }
    }
  }
}