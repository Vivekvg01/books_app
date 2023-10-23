import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookDetailsController extends GetxController {
  List arguments = [];
  @override
  void onInit() {
    arguments = Get.arguments;
    super.onInit();
  }

  RxBool isFavorite = false.obs;

  Future<void> addToFavorites({
    required String bookName,
    required String author,
    required String publisher,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final Map<String, dynamic> bookData = {
      'book_name': bookName,
      'author': author,
      'publisher': publisher,
    };

    String jsonString = sharedPreferences.getString('fav_list').toString();

    final List list = jsonDecode(jsonString);
    list.add(bookData);

    await sharedPreferences.setString('fav_list', jsonEncode(list));
  }
}
