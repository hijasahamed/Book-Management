import 'dart:convert';
import 'dart:developer';

import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/shimmers.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

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
                        return BookItem(book: book, screenSize: screenSize);
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final BooksApiModel book;
  final Size screenSize;
  const BookItem({super.key, required this.book,required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorWhite,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: book.coverPictureURL.isNotEmpty
                  ? Padding(
                    padding: EdgeInsets.all(screenSize.width/50),
                    child: Image.network(
                        book.coverPictureURL,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.broken_image,
                          size: screenSize.height * (60 / 800),
                          color: Colors.grey,
                        ),
                      ),
                  )
                  : Icon(
                      Icons.broken_image,
                      size: screenSize.height * (60 / 800),
                      color: Colors.grey,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenSize.height * 0.01,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: book.title, color: const Color(0XFF1D1D1F), size: screenSize.width * (13/360), fontFamily: 'interMedium', weight: FontWeight.normal,ellipsis: true,maxline: false,),
                FutureBuilder<String?>(
                  future: fetchAuthorNameById(id: book.authorId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return TextWidget(
                        text: 'Loading...',
                        color: const Color(0XFF5C5C5C),
                        size: screenSize.width * (11 / 360),
                        fontFamily: 'interRegular',
                        weight: FontWeight.normal,
                      );
                    } else if (snapshot.hasError) {
                      return TextWidget(
                        text: 'Error loading author',
                        color: Colors.red,
                        size: screenSize.width * (11 / 360),
                        fontFamily: 'interRegular',
                        weight: FontWeight.normal,
                      );
                    } else {
                      return TextWidget(
                        text: snapshot.data ?? 'Unknown Author',
                        color: const Color(0XFF5C5C5C),
                        size: screenSize.width * (11 / 360),
                        fontFamily: 'interRegular',
                        weight: FontWeight.normal,
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: const Color(0XFFFFC700), size: screenSize.height * (15 / 800)),
                    SizedBox(width: screenSize.width * (4 / 360)),
                    TextWidget(text: book.starCount.toString(), color: const Color(0XFF1D1D1F), size: screenSize.width * (11/360), fontFamily: 'interRegular', weight: FontWeight.normal,ellipsis: true,maxline: false,),
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


class BooksApiModel {
  final String id;
  final String title;
  final String description;
  final String publishedDate;
  final String authorId;
  final String coverPictureURL;
  final int price;
  final List ratings;
  final int starCount;

  BooksApiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.authorId,
    required this.coverPictureURL,
    required this.price,
    required this.ratings,
    required this.starCount
  });

  factory BooksApiModel.fromJson(Map<String, dynamic> json) {
    return BooksApiModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      publishedDate: json['publishedDate'].toString(),
      authorId: json['authorId'].toString(),
      coverPictureURL: json['coverPictureURL'].toString(),
      price: json['price'],
      ratings: json['ratings'],
      starCount: json['starCount'],
    );
  }
}


Future<List<BooksApiModel>> fetchBookDetails()async{
  const url = 'https://assessment.eltglobal.in/api/books?page=1&limit=10';
  try{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      final List results = jsonData['result'];
      return results.map((json) => BooksApiModel.fromJson(json),).toList();      
    }else{
      return [];
    }
  }
  catch (e){
    log(e.toString());
  }
  return [];
}

Future<String?> fetchAuthorNameById({required String id}) async {
  var url = 'https://assessment.eltglobal.in/api/authors/$id';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final result = jsonData['result'];
      return result['name'];
    } else {
      log('Failed to load author data: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}