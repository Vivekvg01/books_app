import 'package:books_app/app/modules/home/views/widget/book_card.dart';
import 'package:books_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Books',
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey.shade200,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.FAVORITES);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return BookCard(
                    title: controller.books[index].volumeInfo.title,
                    imgUrl: controller
                        .books[index].volumeInfo.imageLinks.smallThumbnail,
                    author: controller.books[index].volumeInfo.authors[0],
                    category: 'Programming',
                    publisher:
                        controller.books[index].volumeInfo.publisher ?? '',
                    description: controller.books[index].volumeInfo.description,
                    bookID: controller.books[index].id,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                itemCount: controller.books.length,
              ),
      ),
    );
  }
}
