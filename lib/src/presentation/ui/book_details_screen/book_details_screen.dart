import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/widgets/books_screen_widgets/body/book_items/book_author/book_author.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

dynamic ratingValue=0;

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
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
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
      ),
      bottomNavigationBar: BottomAppBar(
        color: colorWhite,
        child: Row(
          children: [
            TextWidget(text: '₹ ${book.price}.00', color: const Color(0XFF1D1D1F), size: screenSize.width * (18/360), fontFamily: 'interSemiBold', weight: FontWeight.normal,ellipsis: true,maxline: false,),
            const Spacer(),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: colorWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(screenSize.width/20)),
                  ),
                  builder: (context) => AddRatingBottomSheet(screenSize: screenSize),
                );
              },
              child: Ink(
                padding: EdgeInsets.all(screenSize.width/50),
                decoration: BoxDecoration(
                  color: const Color(0XFFF56C04),
                  borderRadius: BorderRadius.circular(screenSize.width/75)
                ),
                child: TextWidget(text: 'Add rating', color: colorWhite, size: screenSize.width * (13/360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class AddRatingBottomSheet extends StatelessWidget {
  final Size screenSize;

  const AddRatingBottomSheet({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenSize.width/9,
          height: screenSize.height/200,
          margin: EdgeInsets.only(bottom: screenSize.height /40,top: screenSize.height /55),
          decoration: BoxDecoration(
            color: const Color(0XFFC0C0C0),
            borderRadius: BorderRadius.circular(screenSize.width/85),
          ),
        ),
        TextWidget(text: 'Add rating', color: const Color(0XFF1D1D1F), size: screenSize.width * (18 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
        SizedBox(height: screenSize.height * 0.02),
        Container(
          height: screenSize.height/10,
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 1,color: searchBarColor),bottom: BorderSide(width: 1,color: searchBarColor))
          ),
          child: Center(
            child: RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0XFFFFC700),
              ),
              onRatingUpdate: (rating) {
                ratingValue = rating;
              },
            ),
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Padding(
          padding: EdgeInsets.all(screenSize.width/25),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFFF56C04),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenSize.width / 50),
              ),
              minimumSize: Size(double.infinity, screenSize.height * 0.06),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: TextWidget(text: 'Submit', color: colorWhite, size: screenSize.width * (14 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}