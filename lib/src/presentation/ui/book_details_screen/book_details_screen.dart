import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/app_bar/book_details_appbar.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/body/book_details_body.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/bottom_bar/book_details_bottom_nav.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


dynamic ratingValue = 0;
class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.screenSize, required this.book});
  final Size screenSize;
  final BooksApiModel book;

  @override
  Widget build(BuildContext context) {
    final DateTime? publishedDate = DateTime.tryParse(book.publishedDate);
    final String formattedDate = publishedDate != null
        ? DateFormat('MMM dd, yy').format(publishedDate)
        : 'Unknown date'; 
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: BookDetailsAppBar(screenSize: screenSize,),
      body: BookDetailsBody(screenSize: screenSize, book: book, formattedDate: formattedDate),
      bottomNavigationBar: BookDetailsBottomNavBar(book: book, screenSize: screenSize),
    );
  }
}