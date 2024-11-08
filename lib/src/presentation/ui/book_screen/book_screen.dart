import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidget(text: 'App name', color: bookScreenHeadColor, size: screenSize.width * (20 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
      ),
    );
  }
}