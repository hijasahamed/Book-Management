import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        automaticallyImplyLeading: false,
        title: TextWidget(text: 'App name', color: bookScreenHeadColor, size: screenSize.width * (20 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
      ),
      body: Column(
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
                  TextWidget(text: 'Search...', color: searchTextColor, size: screenSize.width * (14 / 360), fontFamily: 'interRegular', weight: FontWeight.normal)
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: searchBarColor,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 1.5,
                  crossAxisSpacing: 1.5,                 
                  childAspectRatio: 0.65,       
                ),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return BookItem(book: book,screenSize: screenSize,);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final Book book;
  final Size screenSize;
  const BookItem({super.key, required this.book,required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorWhite,
      child: Column(
        children: [
          Expanded(child: Center(child: Image.asset('assets/images/book profile.png',))),       
          Padding(
            padding: EdgeInsets.all(screenSize.height * 0.01,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: book.title, color: const Color(0XFF1D1D1F), size: screenSize.width * (13/360), fontFamily: 'interMedium', weight: FontWeight.normal,ellipsis: true,maxline: false,),
                TextWidget(text: book.author, color: const Color(0XFF5C5C5C), size: screenSize.width * (11/360), fontFamily: 'interRegular', weight: FontWeight.normal,ellipsis: true,maxline: false,),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0XFFFFC700), size: screenSize.height * (15 / 800)),
                    SizedBox(width: screenSize.width * (4 / 360)),
                    TextWidget(text: book.rating.toString(), color: const Color(0XFF1D1D1F), size: screenSize.width * (11/360), fontFamily: 'interRegular', weight: FontWeight.normal,ellipsis: true,maxline: false,),
                  ],
                ),
                SizedBox(height: screenSize.height * (6 / 800)),
                TextWidget(text: '₹ ${book.price}', color: const Color(0XFF1D1D1F), size: screenSize.width * (13/360), fontFamily: 'interSemiBold', weight: FontWeight.normal,ellipsis: true,maxline: false,),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class Book {
  final String imageUrl;
  final String title;
  final String author;
  final double rating;
  final double price;

  Book({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.rating,
    required this.price,
  });
}


final books = [
  Book(
    imageUrl: 'assets/images/Book Image.svg',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T. Kiyosaki',
    rating: 4.0,
    price: 850.0,
  ),
  Book(
    imageUrl: 'assets/images/Book Image.svg',
    title: 'Atomic Habits',
    author: 'James Clear',
    rating: 4.0,
    price: 899.0,
  ),
  Book(
    imageUrl: 'assets/images/Book Image.svg',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T. Kiyosaki',
    rating: 4.0,
    price: 850.0,
  ),
  Book(
    imageUrl: 'assets/images/Book Image.svg',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T. Kiyosaki',
    rating: 4.0,
    price: 850.0,
  ),
  Book(
    imageUrl: 'assets/images/Book Image.svg',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T. Kiyosaki',
    rating: 4.0,
    price: 850.0,
  ),
  Book(
    imageUrl: 'assets/images/Book Image.svg',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T. Kiyosaki',
    rating: 4.0,
    price: 850.0,
  ),
  Book(
    imageUrl: 'assets/images/Book Image.svg',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T. Kiyosaki',
    rating: 4.0,
    price: 850.0,
  ),
];