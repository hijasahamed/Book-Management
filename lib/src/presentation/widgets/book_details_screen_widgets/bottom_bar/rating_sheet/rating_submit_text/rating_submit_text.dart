import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RatingSubmitText extends StatelessWidget {
  const RatingSubmitText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
        text: 'Submit',
        color: colorWhite,
        size: screenSize.width * (14 / 360),
        fontFamily: 'interSemiBold',
        weight: FontWeight.normal);
  }
}
