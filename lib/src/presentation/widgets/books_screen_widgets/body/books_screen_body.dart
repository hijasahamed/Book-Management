import 'package:book_management/src/data/datasource/remote_service.dart';
import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/ui/book_details_screen/book_details_screen.dart';
import 'package:book_management/src/presentation/widgets/books_screen_widgets/body/book_items/book_items.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BooksScreenBody extends StatefulWidget {
  const BooksScreenBody({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<BooksScreenBody> createState() => _BooksScreenBodyState();
}

class _BooksScreenBodyState extends State<BooksScreenBody> {
  final TextEditingController _searchController = TextEditingController();
  List<BooksApiModel> _allBooks = [];
  List<BooksApiModel> _filteredBooks = [];
  late Future<void> _initialFetch;

  @override
  void initState() {
    super.initState();
    _initialFetch = _fetchBooks();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredBooks = _allBooks;
      } else {
        _filteredBooks = _allBooks
            .where((book) => book.title.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  Future<void> _fetchBooks() async {
    _allBooks = await fetchBookDetails();
    _filteredBooks = _allBooks;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(widget.screenSize.width / 25),
          child: Container(
            height: widget.screenSize.height / 22,
            decoration: BoxDecoration(
              color: searchBarColor,
              borderRadius: BorderRadius.circular(widget.screenSize.width * (8 / 360)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: widget.screenSize.width / 40,
                      right: widget.screenSize.width / 35),
                  child: SvgPicture.asset(
                    'assets/images/search icon.svg',
                    fit: BoxFit.cover,
                    height: widget.screenSize.height * (10 / 360),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: searchTextColor,
                        fontSize: widget.screenSize.width * (14 / 360),
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
          child: FutureBuilder<void>(
            future: _initialFetch,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ItemShimmer(
                  screenSize: widget.screenSize,
                  isAuthors: false,
                  isBooks: true,
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load books'));
              } else {
                return Container(
                  color: searchBarColor,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.5,
                      crossAxisSpacing: 1.5,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: _filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = _filteredBooks[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return BookDetailsScreen(screenSize: widget.screenSize, book: book);
                          }));
                        },
                        child: BookItem(book: book, screenSize: widget.screenSize),
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