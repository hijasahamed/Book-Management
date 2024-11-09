import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookDetailsAppBar({
    super.key,
    required this.screenSize
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorWhite,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/19);
}