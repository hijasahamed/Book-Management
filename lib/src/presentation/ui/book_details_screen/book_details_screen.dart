import 'dart:convert';
import 'dart:developer';

import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/bloc/books_screen_bloc/bloc/books_screen_bloc.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/app_bar/book_details_appbar.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/body/book_details_body.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/bottom_bar/book_details_bottom_nav.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/bottom_bar/rating_sheet/decode_token/decode_token.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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









Future<void> addUserRating({required dynamic rating, required String bookId,required BooksScreenBloc booksScreenBloc}) async { 
  try {
    booksScreenBloc.add(RatingAddingCircularEvent());
    int intRating = rating.toInt(); 
    String? userId = await decodeToken();
    final sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    log(token.toString());
    if (userId == null) {
      log("Error: User token is null");
      return;
    }

    final body = json.encode({
      'userId': userId,
      'rating': intRating,
    });

    final url = 'https://assessment.eltglobal.in/api/books/$bookId/ratings:add';
    final uri = Uri.parse(url);
    final response = await http.patch(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      log("Rating updated successfully");
    
    } else {
        log(response.body);
      log("Failed to update rating with status code: ${response.statusCode}");
    }
    booksScreenBloc.add(RatingAddingCircularStopEvent());
  } catch (e) {
    log("Error during rating update: $e");
  }
}