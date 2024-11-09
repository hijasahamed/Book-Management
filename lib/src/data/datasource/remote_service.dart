import 'dart:convert';
import 'dart:developer';
import 'package:book_management/src/data/models/models.dart';
import 'package:book_management/src/presentation/bloc/books_screen_bloc/bloc/books_screen_bloc.dart';
import 'package:book_management/src/presentation/widgets/book_details_screen_widgets/bottom_bar/rating_sheet/decode_token/decode_token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteService{

}

/// Fetch all book details from Api
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


/// Fetch autors name with [authorId]
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


// Register the user in
Future<String?> registerUser(
    {required String userName, required String password}) async {
  try {
    final body = {
      'username': userName,
      'password': password,
    };
    const url = 'https://assessment.eltglobal.in/api/auth/register';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: body,
    );

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);

      final String? token = responseData['result']?['access_token'];

      if (token != null) {
        log("JWT Token: $token");
      } else {
        log("Token not found in response.");
      }
      return token;
    } else {
      log("Registration failed with status code: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    log("Error during registration: $e");
    return null;
  }
}


// Fetches all the Authors details
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


// Function for rating the particular book
Future<void> addUserRating({required dynamic rating, required String bookId,required BooksScreenBloc booksScreenBloc}) async { 
  try {
    booksScreenBloc.add(RatingAddingCircularEvent());
    int intRating = rating.toInt(); 
    String? userId = await decodeToken();
    final sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    log(token.toString());
    if (userId == null) {
      log("Error: User token is null");
      return;
    }

    final body = json.encode({
      'userId': userId,
      'rating': intRating,
    });

    final url = 'https://assessment.eltglobal.in/api/books/$bookId/ratings:add';
    final uri = Uri.parse(url);
    final response = await http.patch(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      log("Rating updated successfully");
    
    } else {
        log(response.body);
      log("Failed to update rating with status code: ${response.statusCode}");
    }
    booksScreenBloc.add(RatingAddingCircularStopEvent());
  } catch (e) {
    log("Error during rating update: $e");
  }
}