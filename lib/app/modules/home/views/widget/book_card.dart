import 'package:books_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String author;
  final String category;
  final String publisher;
  final String description;
  final String bookID;

  const BookCard({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.author,
    required this.category,
    required this.publisher,
    required this.description,
    required this.bookID,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.BOOK_DETAILS, arguments: [
          title,
          imgUrl,
          author,
          category,
          publisher,
          description,
          bookID,
        ]);
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: 110,
                  margin: const EdgeInsets.all(10),
                  child: Image.network(imgUrl),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 210,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 6.0),
                Text('By : $author'),
                const SizedBox(height: 6.0),
                Text('Category : $category'),
                const SizedBox(height: 6.0),
                Text('Publisher : $publisher'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
