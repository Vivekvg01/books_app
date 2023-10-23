import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.isFavorite.value = !controller.isFavorite.value;
              controller.addToFavorites(
                bookName: controller.arguments[0],
                author: controller.arguments[2],
                publisher: controller.arguments[4],
              );
              // print(controller.arguments[6]);
              // print(controller.isFavorite.value);
            },
            icon: Obx(
              () => Icon(
                controller.isFavorite.value
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: controller.isFavorite.value ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Container(
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Image.network(
              '${controller.arguments[1]}',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.arguments[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text('By : ${controller.arguments[2]}'),
                const SizedBox(height: 6.0),
                Text('Category : ${controller.arguments[3]}'),
                const SizedBox(height: 6.0),
                Text('Publisher : ${controller.arguments[4]}'),
                const SizedBox(height: 6.0),
                Text(
                  'Description : ${controller.arguments[5]}',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
