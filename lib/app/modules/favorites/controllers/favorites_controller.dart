import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesController extends GetxController {
  @override
  void onInit() {
    getFavoirites();
    super.onInit();
  }

  List favoriteBookList = [];

  void getFavoirites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? list = prefs.getString('fav_list');
    if (list != null) {
      List data = jsonDecode(list);
      print(data);
      favoriteBookList.addAll(data);
    }
  }
}
