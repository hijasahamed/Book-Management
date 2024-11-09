import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/ui/book_screen/body/book_items/book_author/book_author.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final BooksApiModel book;
  final Size screenSize;
  const BookItem({super.key, required this.book,required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorWhite,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: book.coverPictureURL.isNotEmpty
                  ? Padding(
                    padding: EdgeInsets.all(screenSize.width/50),
                    child: Image.network(
                        book.coverPictureURL,
                        fit: BoxFit.cover, 
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.broken_image,
                          size: screenSize.height * (60 / 800),
                          color: Colors.grey,
                        ),
                      ),
                  )
                  : Icon(
                      Icons.broken_image,
                      size: screenSize.height * (60 / 800),
                      color: Colors.grey,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenSize.height * 0.01,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: book.title, color: const Color(0XFF1D1D1F), size: screenSize.width * (13/360), fontFamily: 'interMedium', weight: FontWeight.normal,ellipsis: true,maxline: false,),
                BookAuthor(book: book, screenSize: screenSize,size: screenSize.width * (11 / 360),color: const Color(0XFF5C5C5C),),
                Row(
                  children: [
                    Icon(Icons.star, color: const Color(0XFFFFC700), size: screenSize.height * (15 / 800)),
                    SizedBox(width: screenSize.width * (4 / 360)),
                    TextWidget(text: book.starCount.toString(), color: const Color(0XFF1D1D1F), size: screenSize.width * (11/360), fontFamily: 'interRegular', weight: FontWeight.normal,ellipsis: true,maxline: false,),
                  ],
                ),
                SizedBox(height: screenSize.height * (6 / 800)),
                TextWidget(text: '₹ ${book.price}', color: const Color(0XFF1D1D1F), size: screenSize.width * (13/360), fontFamily: 'interSemiBold', weight: FontWeight.normal,ellipsis: true,maxline: false,),
              ],
            ),
          )
        ],
      ),
    );
  }
}