
import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/widgets/books_screen_widgets/body/book_items/book_author/book_author.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({
    super.key,
    required this.screenSize,
    required this.book,
    required this.formattedDate,
  });

  final Size screenSize;
  final BooksApiModel book;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height / 2.9,
            color: const Color(0XFFF8F8F8),
            child: Center(
              child: Container(
                margin: EdgeInsets.all(screenSize.width / 20),
                width: screenSize.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (book.coverPictureURL.isNotEmpty)
                        ? NetworkImage(book.coverPictureURL)
                        : const AssetImage('assets/placeholder_image.png') as ImageProvider,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: (book.coverPictureURL.isEmpty)
                    ? const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenSize.width/30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: screenSize.width/1.4,
                      child: TextWidget(text: book.title, color: const Color(0XFF1D1D1F), size: screenSize.width * (19 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal,maxline: true,)
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(screenSize.width/100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenSize.width/75),
                        border: Border.all(width: 1.5,color: searchBarColor)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: screenSize.width/19),
                          SizedBox(width: screenSize.width * 0.01),
                          TextWidget(text: book.starCount.toStringAsFixed(1), color: const Color(0XFF1D1D1F), size: screenSize.width * (12 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal)
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextWidget(text: 'by', color: const Color(0XFF1D1D1F), size: screenSize.width * (14 / 360), fontFamily: 'interRegular', weight: FontWeight.normal),
                    SizedBox(width: screenSize.width/90,), 
                    BookAuthor(book: book, screenSize: screenSize,color: const Color(0XFF1D1D1F),size: screenSize.width * (14 / 360),),
                  ],
                ),
                SizedBox(height: screenSize.height/100),
                TextWidget(text: 'Published date: $formattedDate', color: const Color(0XFF5C5C5C), size: screenSize.width * (12 / 360), fontFamily: 'interRegular', weight: FontWeight.normal),                    
                SizedBox(height: screenSize.height/100),
                Text(
                  book.description,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: const Color(0XFF1D1D1F),
                    fontSize: screenSize.width * (13 / 360),
                    fontFamily: 'interRegular',
                    fontWeight: FontWeight.normal
                  ),
                ) 
              ],
            ),
          ),
        ],
      ),
    );
  }
}