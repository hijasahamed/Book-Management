import 'package:book_management/src/data/datasource/remote_service.dart';
import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/shimmers.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AuthorScreenBody extends StatelessWidget {
  const AuthorScreenBody({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AuthorApiModel>>(
      future: fetchAuthorsDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ItemShimmer(screenSize: screenSize, isBooks: false, isAuthors: true);
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No authors found.'));
        } else {
          final authors = snapshot.data!;
          return ListView.builder(
            itemCount: authors.length,
            itemBuilder: (context, index) {
              final author = authors[index];
              Color backgroundColor = avatarColors[index % avatarColors.length].withOpacity(0.040);
              Color textColor = avatarColors[index % avatarColors.length];
              return Container(
                margin: EdgeInsets.only(left: screenSize.width / 30,right: screenSize.width / 30,top: screenSize.width / 45,bottom: screenSize.width / 45),
                padding: EdgeInsets.all(screenSize.width / 75),
                decoration: BoxDecoration(
                  color: const Color(0XFFF8F8F8),
                  border: Border.all(width: 1.5, color: searchBarColor),
                  borderRadius: BorderRadius.circular(screenSize.width * (9 / 360)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: backgroundColor,
                      radius: screenSize.height * (20 / 800),
                      child: TextWidget(
                        text: author.name.isNotEmpty ? author.name[0] : 'O',
                        color: textColor,
                        size: screenSize.width * (15 / 360),
                        fontFamily: 'interMedium',
                        weight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: screenSize.width / 75),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: author.name,
                            color: Colors.black,
                            size: screenSize.width * (13 / 360),
                            fontFamily: 'interMedium',
                            weight: FontWeight.normal,
                          ),
                          Text(
                            author.biography,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenSize.width * (11 / 360),
                              color: authDataTypeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}