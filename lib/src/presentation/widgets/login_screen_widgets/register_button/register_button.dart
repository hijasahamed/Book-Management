// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:book_management/src/presentation/ui/home_screen/home_screen.dart';
import 'package:book_management/src/presentation/ui/login_screen/login_screen.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/snackbar_widget.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
        onTap: ()async {         
          registerButtonClicked(userName: userNameController.text, password: passwordController.text,confirmPassword: confirmPasswordController.text,context: context,userLoginformkey: userLoginformkey,screenSize: screenSize);
        },
        child: Ink(
          height: screenSize.height * (20 / 360),
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


Future<void> registerButtonClicked({required String userName, required String password,required String confirmPassword,required BuildContext context, userLoginformkey,required Size screenSize})async{
  if(userLoginformkey.currentState!.validate()){
    if(password == confirmPassword){
      final token = await registerUser(userName: userName, password: password);
      if (token != null) {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('token', token);
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen(screenSize: screenSize);
          },
        ),
        (route) => false,
      );
      } else {
        snackbarMessageWidget(text: 'Registration Faild', context: context, color: Colors.red, textColor: colorWhite, behavior: SnackBarBehavior.floating, time: 3000);
      }
    }else{
      snackbarMessageWidget(text: 'Password not correct', context: context, color: Colors.red, textColor: colorWhite, behavior: SnackBarBehavior.floating, time: 3000);
    }
  }
}


Future<String?> registerUser({required String userName, required String password}) async {
  try {
    final body = {
      'username': userName,
      'password': password,
    };
    const url = 'https://assessment.eltglobal.in/api/auth/register';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: body,
    );

    if (response.statusCode == 201) { 
      final responseData = json.decode(response.body);

      final String? token = responseData['result']?['access_token'];

      if (token != null) {
        log("JWT Token: $token");
      } else {
        log("Token not found in response.");
      }
      return token;
    } else {
      log("Registration failed with status code: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    log("Error during registration: $e");
    return null;
  }
}