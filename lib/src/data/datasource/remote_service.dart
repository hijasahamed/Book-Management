import 'dart:convert';
import 'dart:developer';
import 'package:book_management/src/data/models/models.dart';
import 'package:http/http.dart' as http;

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