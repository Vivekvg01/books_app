import 'package:books_app/app/modules/home/views/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favorites',
            style: TextStyle(color: Colors.grey),
          ),
          elevation: 0.0,
          backgroundColor: Colors.grey.shade200,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            ListTile(
              title: Text(
                controller.favoriteBookList[0]['book_name'],
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: controller.favoriteBookList.length,
        )

        //  ListView(
        //   padding: const EdgeInsets.all(10.0),
        //   children: [
        //     // BookCard(
        //     //   title: 'title',
        //     //   imgUrl: 'imgUrl',
        //     //   author: 'author',
        //     //   category: 'category',
        //     //   publisher: 'publisher',
        //     //   description: 'description',
        //     //   bookID: 'bookID',
        //     // )
        //   ],
        // ),
        );
  }
}
