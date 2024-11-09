import 'package:book_management/src/data/datasource/remote_service.dart';
import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/ui/book_details_screen/book_details_screen.dart';
import 'package:book_management/src/presentation/widgets/books_screen_widgets/body/book_items/book_items.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BooksScreenBody extends StatelessWidget {
  const BooksScreenBody({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(screenSize.width/25),
          child: Container(
            height: screenSize.height / 22,
            decoration: BoxDecoration(
              color: searchBarColor,
              borderRadius: BorderRadius.circular(screenSize.width * (8 / 360))
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width/40,right: screenSize.width/35),
                  child: SvgPicture.asset('assets/images/search icon.svg',fit: BoxFit.cover,height: screenSize.height * (10 / 360),),
                ),
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: searchTextColor,
                        fontSize: screenSize.width * (14 / 360),
                        fontFamily: 'interRegular',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<BooksApiModel>>(
            future: fetchBookDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ItemShimmer(screenSize: screenSize,isAuthors: false,isBooks: true,);
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load books'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No books available'));
              } else {
                final books = snapshot.data!;
                return Container(
                  color: searchBarColor,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.5,
                      crossAxisSpacing: 1.5,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return BookDetailsScreen(screenSize: screenSize,book: book,);
                          },));
                        },
                        child: BookItem(book: book, screenSize: screenSize)
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}