import 'dart:convert';

import 'package:books_app/app/modules/home/services/books_services.dart';
import 'package:books_app/app/modules/models/books_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> favList = [];
    String jsonEdodedList = jsonEncode(favList);
    await sharedPreferences.setString('fav_list', jsonEdodedList);
    getBooks();
    super.onInit();
  }

  List<Item> books = [];

  RxBool isLoading = false.obs;

  Future<void> getBooks() async {
    isLoading(true);
    final response = await BookServices().getAllBooks();
    if (response != null && response.items.isNotEmpty) {
      books = response.items;
    }
    isLoading(false);
  }
}
