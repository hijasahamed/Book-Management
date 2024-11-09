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
    on<RatingAddingCircularEvent>(ratingAddingCircularEvent);
    on<RatingAddingCircularStopEvent>(ratingAddingCircularStopEvent);
  }

  FutureOr<void> changeTabIndexEvent(
    ChangeTabIndexEvent event, Emitter<BooksScreenState> emit) {
      emit(ChangeTabIndexState());
  }

  FutureOr<void> ratingAddingCircularEvent(
    RatingAddingCircularEvent event, Emitter<BooksScreenState> emit) {
      emit(RatingAddingCircularState());
  }

  FutureOr<void> ratingAddingCircularStopEvent(
    RatingAddingCircularStopEvent event, Emitter<BooksScreenState> emit) {
      emit(RatingAddingCircularStopState());
  }
}
