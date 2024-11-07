import 'package:book_management/src/presentation/bloc/books_screen_bloc/bloc/books_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    BooksScreenBloc booksScreenBloc = BooksScreenBloc();
    int tabIndex = 0;
    List tabScreen = [

    ];
    return BlocBuilder<BooksScreenBloc, BooksScreenState>(
      bloc: booksScreenBloc,
      builder: (context, state) {
        return Scaffold(
          body: tabScreen[tabIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabIndex,
            onTap: (index) {
              tabIndex = index;
              booksScreenBloc.add(ChangeTabIndexEvent());
            },
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.car_rental,
                ),
                label: 'Buy',
              ),
            ],
            selectedItemColor: const Color(0XFFF56C04),
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: widget.screenSize.width * (9 / 360),
                fontFamily: 'interSemiBold'),
            unselectedItemColor: const Color(0XFFA39B97),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: widget.screenSize.width * (9 / 360),
                fontFamily: 'interSemiBold'),
          ),
        );
      },
    );
  }
}
