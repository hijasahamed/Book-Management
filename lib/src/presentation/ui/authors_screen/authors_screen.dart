import 'package:book_management/src/presentation/widgets/authors_screen_widgets/app_bar/author_screen_appbar.dart';
import 'package:book_management/src/presentation/widgets/authors_screen_widgets/body/author_screen_body.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AuthorScreenWIdget(screenSize: screenSize),
      body: AuthorScreenBody(screenSize: screenSize),
    );
  }
}