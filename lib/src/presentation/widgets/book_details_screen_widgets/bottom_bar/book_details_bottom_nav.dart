import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/bottom_bar/rating_sheet/rating_sheet.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsBottomNavBar extends StatelessWidget {
  const BookDetailsBottomNavBar({
    super.key,
    required this.book,
    required this.screenSize,
  });

  final BooksApiModel book;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                builder: (context) => AddRatingBottomSheet(screenSize: screenSize,bookId: book.id,),
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
    );
  }
}