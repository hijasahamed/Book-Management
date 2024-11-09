import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) {
      
    });
    on<PasswordObscureVariableSettingEvent>(passwordObscureVariableSettingEvent);
    on<RegisterButtonClickedCircularIndicatorEvent>(registerButtonClickedCircularIndicatorEvent);
    on<RegisterButtonClickedCircularIndicatorStopEvent>(registerButtonClickedCircularIndicatorStopEvent); 
  }

  FutureOr<void> passwordObscureVariableSettingEvent(
    PasswordObscureVariableSettingEvent event, Emitter<LoginScreenState> emit) {
      emit(PasswordObscureVariableSettingState());
  }

  FutureOr<void> registerButtonClickedCircularIndicatorEvent(
    RegisterButtonClickedCircularIndicatorEvent event, Emitter<LoginScreenState> emit) {
      emit(RegisterButtonClickedCircularIndicatorState());
  }

  FutureOr<void> registerButtonClickedCircularIndicatorStopEvent(
    RegisterButtonClickedCircularIndicatorStopEvent event, Emitter<LoginScreenState> emit) {
      emit(RegisterButtonClickedCircularIndicatorStopState());
  }

}