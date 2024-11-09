import 'package:book_management/src/presentation/widgets/books_screen_widgets/app_bar/book_screen_appbar.dart';
import 'package:book_management/src/presentation/widgets/books_screen_widgets/body/books_screen_body.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: BookScreenAppBar(screenSize: screenSize),
      body: BooksScreenBody(screenSize: screenSize),
    );
  }
}