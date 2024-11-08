import 'package:book_management/src/presentation/bloc/books_screen_bloc/bloc/books_screen_bloc.dart';
import 'package:book_management/src/presentation/ui/authors_screen/authors_screen.dart';
import 'package:book_management/src/presentation/ui/book_screen/book_screen.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0; 
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: colorWhite,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: colorWhite,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    tabIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BooksScreenBloc booksScreenBloc = BooksScreenBloc();
    List <Widget> buildSellerTabs(Size screenSize){
      return [
        BookScreen(screenSize: widget.screenSize,), AuthorsScreen(screenSize: widget.screenSize,)
      ];
    }
    return BlocBuilder<BooksScreenBloc, BooksScreenState>(
      bloc: booksScreenBloc,
      builder: (context, state) {
        List<Widget> tabScreen = buildSellerTabs(widget.screenSize);
        return Scaffold(          
          body: tabScreen[tabIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: colorWhite,
            currentIndex: tabIndex,
            onTap: (index) {
              tabIndex = index;
              booksScreenBloc.add(ChangeTabIndexEvent());
            },
            items:  [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: SvgPicture.asset((tabIndex==0)? 'assets/images/home logo orange.svg' : 'assets/images/home logo grey.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: SvgPicture.asset((tabIndex==1)? 'assets/images/author logo orange.svg' : 'assets/images/author logo grey.svg'),
                label: 'Authors',
              ),
            ],
            selectedItemColor: const Color(0XFFF56C04),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: widget.screenSize.width * (9 / 360),
              fontFamily: 'interSemiBold'
            ),
            unselectedItemColor: const Color(0XFFA39B97),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: widget.screenSize.width * (9 / 360),
              fontFamily: 'interSemiBold'
            ),
          ),
        );
      },
    );
  }
}