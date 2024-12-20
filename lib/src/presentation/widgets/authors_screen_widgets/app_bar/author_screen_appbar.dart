import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AuthorScreenWIdget extends StatelessWidget implements PreferredSizeWidget {
  const AuthorScreenWIdget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorWhite,
      automaticallyImplyLeading: false,
      title: TextWidget(text: 'Authors', color: bookScreenHeadColor, size: screenSize.width * (20 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/14);
}