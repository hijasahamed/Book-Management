// ignore_for_file: use_build_context_synchronously
import 'package:book_management/src/data/datasource/remote_service.dart';
import 'package:book_management/src/presentation/bloc/login_screen_bloc/bloc/login_screen_bloc.dart';
import 'package:book_management/src/presentation/ui/home_screen/home_screen.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerButtonClicked(
    {required String userName,
    required String password,
    required String confirmPassword,
    required BuildContext context,
    userLoginformkey,
    required LoginScreenBloc registerButtonObj,
    required Size screenSize}) async {
      registerButtonObj.add(RegisterButtonClickedCircularIndicatorEvent());
  if (userLoginformkey.currentState!.validate()) {
    if (password == confirmPassword) {
      registerButtonObj.add(RegisterButtonClickedCircularIndicatorEvent());
      final token = await registerUser(userName: userName, password: password);
      if (token != null) {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('token', token);
        registerButtonObj
            .add(RegisterButtonClickedCircularIndicatorStopEvent());
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen(screenSize: screenSize);
            },
          ),
          (route) => false,
        );
      } else {
        registerButtonObj
            .add(RegisterButtonClickedCircularIndicatorStopEvent());
        snackbarMessageWidget(
            text: 'Registration Faild',
            context: context,
            color: Colors.red,
            textColor: colorWhite,
            behavior: SnackBarBehavior.floating,
            time: 3000);
      }
    } else {
      snackbarMessageWidget(
          text: 'Password not correct',
          context: context,
          color: Colors.red,
          textColor: colorWhite,
          behavior: SnackBarBehavior.floating,
          time: 3000);
    }
  }
}