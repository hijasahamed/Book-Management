import 'package:book_management/src/presentation/ui/book_details_screen/book_details_screen.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddRatingBottomSheet extends StatelessWidget {
  final Size screenSize;
  final String bookId;
  const AddRatingBottomSheet({super.key, required this.screenSize,required this.bookId});

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
              addUserRating(rating: ratingValue,bookId: bookId);
            },
            child: TextWidget(text: 'Submit', color: colorWhite, size: screenSize.width * (14 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}