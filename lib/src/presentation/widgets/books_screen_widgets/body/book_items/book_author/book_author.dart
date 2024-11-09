import 'package:book_management/src/data/datasource/remote_service.dart';
import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookAuthor extends StatelessWidget {
  const BookAuthor({
    super.key,
    required this.book,
    required this.screenSize,
    required this.color,
    required this.size
  });

  final BooksApiModel book;
  final Size screenSize;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: fetchAuthorNameById(id: book.authorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return TextWidget(
            text: 'Loading...',
            color: const Color(0XFF5C5C5C),
            size: screenSize.width * (11 / 360),
            fontFamily: 'interRegular',
            weight: FontWeight.normal,
          );
        } else if (snapshot.hasError) {
          return TextWidget(
            text: 'Error loading author',
            color: Colors.red,
            size: screenSize.width * (11 / 360),
            fontFamily: 'interRegular',
            weight: FontWeight.normal,
          );
        } else {
          return TextWidget(
            text: snapshot.data ?? 'Unknown Author',
            color: color,
            size: size,
            fontFamily: 'interRegular',
            weight: FontWeight.normal,
          );
        }
      },
    );
  }
}