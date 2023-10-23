import 'dart:convert';
import 'dart:developer';
import 'package:books_app/app/modules/models/books_model.dart';
import 'package:http/http.dart' as http;

class BookServices {
  Future<BooksModel?> getAllBooks() async {
    try {
      final url =
          Uri.parse('https://www.googleapis.com/books/v1/volumes?q=flutter');
      final response = await http.get(url);
      final jsonString = jsonDecode(response.body);
      return BooksModel.fromJson(jsonString);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
