import 'package:book_management/screens/login_screen/confirm_password_form/confirm_password_form.dart';
import 'package:book_management/screens/login_screen/login_screen_logo_image/login_screen_logo_image.dart';
import 'package:book_management/screens/login_screen/password_form/password_form.dart';
import 'package:book_management/screens/login_screen/register_button/register_button.dart';
import 'package:book_management/screens/login_screen/user_name_form/user_name_form.dart';
import 'package:book_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key,required this.screenSize});
  final Size screenSize;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: colorWhite,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: colorWhite,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(widget.screenSize.width/20),
            child: Column(
              mainAxisSize: MainAxisSize.max,  
              crossAxisAlignment: CrossAxisAlignment.start,       
              children: [
                LoginScreenLogoImage(screenSize: widget.screenSize),                
                UserNameForm(screenSize: widget.screenSize),
                PasswordForm(screenSize: widget.screenSize),
                ConfirmPasswordForm(screenSize: widget.screenSize),
                RegisterButton(screenSize: widget.screenSize)
              ],
            ),
          ),
        ),
      ),
    );
  }
}