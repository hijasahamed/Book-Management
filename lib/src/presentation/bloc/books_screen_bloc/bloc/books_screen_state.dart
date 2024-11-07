part of 'books_screen_bloc.dart';

@immutable
sealed class BooksScreenState {}

final class BooksScreenInitial extends BooksScreenState {}

class ChangeTabIndexState extends BooksScreenState {}