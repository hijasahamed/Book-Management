import 'dart:convert';
import 'dart:developer';

import 'package:book_management/src/presentation/widgets/common_widgets/colors.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/shimmers.dart';
import 'package:book_management/src/presentation/widgets/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        automaticallyImplyLeading: false,
        title: TextWidget(text: 'Authors', color: bookScreenHeadColor, size: screenSize.width * (20 / 360), fontFamily: 'interSemiBold', weight: FontWeight.normal),
      ),
      body: FutureBuilder<List<AuthorApiModel>>(
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
                  margin: EdgeInsets.all(screenSize.width / 45),
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
      ),
    );
  }
}



class AuthorApiModel {
  final String id;
  final String name;
  final String birthdate;
  final String biography;


  AuthorApiModel({
    required this.id,
    required this.name,
    required this.birthdate,
    required this.biography,

  });

  factory AuthorApiModel.fromJson(Map<String, dynamic> json) {
    return AuthorApiModel(
      id: json['id'].toString(),
      name: json['name'].toString(),
      birthdate: json['birthdate'].toString(),
      biography: json['biography'].toString(),
    );
  }
}

Future<List<AuthorApiModel>> fetchAuthorsDetails()async{
  const url = 'https://assessment.eltglobal.in/api/authors';
  try{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      final List results = jsonData['result'];
      return results.map((json) => AuthorApiModel.fromJson(json),).toList();      
    }else{
      return [];
    }
  }
  catch (e){
    log(e.toString());
  }
  return [];
}

  final List<Color> avatarColors = [
    const Color.fromARGB(255, 7, 168, 243), 
    const Color.fromARGB(255, 16, 71, 21), 
    const Color.fromARGB(255, 241, 5, 33), 
    const Color.fromARGB(255, 255, 159, 14), 
    const Color.fromARGB(255, 255, 4, 92), 
  ];