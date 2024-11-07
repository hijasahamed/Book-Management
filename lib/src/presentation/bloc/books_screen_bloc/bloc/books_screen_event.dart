part of 'books_screen_bloc.dart';

@immutable
sealed class BooksScreenEvent {}

class ChangeTabIndexEvent extends BooksScreenEvent {}