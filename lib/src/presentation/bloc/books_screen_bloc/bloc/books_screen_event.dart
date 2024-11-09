part of 'books_screen_bloc.dart';

@immutable
sealed class BooksScreenEvent {}

class ChangeTabIndexEvent extends BooksScreenEvent {}

class RatingAddingCircularEvent extends BooksScreenEvent {}
class RatingAddingCircularStopEvent extends BooksScreenEvent {}