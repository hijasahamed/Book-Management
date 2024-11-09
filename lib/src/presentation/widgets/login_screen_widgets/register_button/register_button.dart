import 'package:book_management/src/presentation/bloc/login_screen_bloc/bloc/login_screen_bloc.dart';
import 'package:book_management/src/presentation/ui/login_screen/login_screen.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/login_screen_widgets/register_button/register_button_clicked.dart';
import 'package:book_management/src/presentation/widgets/login_screen_widgets/register_button/register_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    LoginScreenBloc registerButtonObj = LoginScreenBloc();
    return Padding(
      padding: EdgeInsets.only(top: screenSize.width / 18),
      child: InkWell(
        onTap: () async {
          registerButtonClicked(
              userName: userNameController.text,
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text,
              context: context,
              screenSize: screenSize,
              userLoginformkey: userLoginformkey,
              registerButtonObj: registerButtonObj);
        },
        child: Ink(
          height: screenSize.height * (20 / 360),
          width: screenSize.width,
          decoration: BoxDecoration(
              color: registerButtonColor,
              borderRadius:
                  BorderRadius.circular(screenSize.width * (7 / 360))),
          child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
            bloc: registerButtonObj,
            builder: (context, state) {              
              return Center(
                child:
                state is RegisterButtonClickedCircularIndicatorStopState ?
                  RegisterText(screenSize: screenSize)
                 : state is RegisterButtonClickedCircularIndicatorState ?
                  const CircularProgressIndicator(color: colorWhite,)
                 : RegisterText(screenSize: screenSize)
              );
            },
          ),
        ),
      ),
    );
  }
}