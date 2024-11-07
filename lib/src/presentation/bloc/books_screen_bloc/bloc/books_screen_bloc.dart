import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'books_screen_event.dart';
part 'books_screen_state.dart';

class BooksScreenBloc extends Bloc<BooksScreenEvent, BooksScreenState> {
  BooksScreenBloc() : super(BooksScreenInitial()) {
    on<BooksScreenEvent>((event, emit) {
      
    });
    on<ChangeTabIndexEvent>(changeTabIndexEvent);
  }

  FutureOr<void> changeTabIndexEvent(
    ChangeTabIndexEvent event, Emitter<BooksScreenState> emit) {
      emit(ChangeTabIndexState());
  }
}
