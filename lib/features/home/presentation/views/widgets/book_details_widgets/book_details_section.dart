import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/data/models/book_model/item.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_actions.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Hero(
            tag: book.volumeInfo.imageLinks.thumbnail,
            child: BookImage(imageUrl: book.volumeInfo.imageLinks.thumbnail),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          book.volumeInfo.title ?? '',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18,
          ),
        ),
        const SizedBox(height: 10),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: book.volumeInfo.pageCount ?? 0,
          rating: book.volumeInfo.averageRating ?? 0,
        ),
        const SizedBox(height: 30),
        BookActions(book: book),
      ],
    );
  }
}
