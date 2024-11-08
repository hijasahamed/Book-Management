part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

class PasswordObscureVariableSettingState extends LoginScreenState {}

class RegisterButtonClickedCircularIndicatorState extends LoginScreenState {}