part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenEvent {}

class PasswordObscureVariableSettingEvent extends LoginScreenEvent {}

class RegisterButtonClickedCircularIndicatorEvent extends LoginScreenEvent {}
class RegisterButtonClickedCircularIndicatorStopEvent extends LoginScreenEvent {}
