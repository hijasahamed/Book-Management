import 'dart:convert';
import 'dart:developer';

import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/app_bar/book_details_appbar.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/body/book_details_body.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/bottom_bar/book_details_bottom_nav.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/bottom_bar/rating_sheet/decode_token/decode_token.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

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









Future<void> addUserRating({required dynamic rating, required String bookId}) async {
  int intRating = rating.toInt();
  
  try {
    String? token = await decodeToken();
    if (token == null) {
      log("Error: User token is null");
      return;
    }
    print(intRating);
    print(bookId);
    print(token);

    final body = json.encode({
      'userId': '67c7d0680d1d0db4',
      'rating': 2,
    });

    const url = 'https://assessment.eltglobal.in/api/books/670f94b2d19360ca93d716eb/ratings:add';
    final uri = Uri.parse(url);
    final response = await http.patch(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImM1YTBiZGJmNWUxZWI0ZTciLCJpYXQiOjE3MzExNDE3NjJ9.7y-NldDb_dIOO5Lj40tIeIsEODjKKqdR4NkW27Zpi-Y',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      log("Rating updated successfully");
    
    } else {
        log(response.body);
      log("Failed to update rating with status code: ${response.statusCode}");
    }
  } catch (e) {
    log("Error during rating update: $e");
  }
}