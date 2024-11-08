import 'package:book_management/src/presentation/bloc/login_screen_bloc/bloc/login_screen_bloc.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Size screenSize;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool isPasswordForm;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      required this.screenSize,
      required this.controller,
      required this.textCapitalization,
      required this.obscureText,
      required this.isPasswordForm});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    LoginScreenBloc loginScreenBloc = LoginScreenBloc();
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: colorWhite,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(widget.screenSize.width * (9 / 360)),
        borderSide: const BorderSide(
          color: Color(0xFFE6E6E6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(widget.screenSize.width * (9 / 360)),
        borderSide: const BorderSide(
          color: Color(0XFFF56C04),
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.all(
              Radius.circular(widget.screenSize.width * (9 / 360)))),
      contentPadding: EdgeInsets.symmetric(
        vertical: widget.screenSize.height / 60,
        horizontal: widget.screenSize.width / 25,
      ),
      hintText: widget.hintText,
      hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: widget.screenSize.width * (15 / 360),
          fontFamily: 'interRegular'),
      suffixIcon: widget.isPasswordForm
          ? BlocBuilder<LoginScreenBloc, LoginScreenState>(
              bloc: loginScreenBloc,
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    obscureText = !obscureText;
                    loginScreenBloc.add(PasswordObscureVariableSettingEvent());
                  },
                  icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off),
                );
              },
            )
          : null,
    );

    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
      bloc: loginScreenBloc,
      builder: (context, state) {
        return TextFormField(
          controller: widget.controller,
          decoration: inputDecoration,
          textCapitalization: widget.textCapitalization,
          style: const TextStyle(color: Color(0XFF1D1D1F)),
          obscureText: widget.isPasswordForm ? obscureText : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        );
      },
    );
  }
}
