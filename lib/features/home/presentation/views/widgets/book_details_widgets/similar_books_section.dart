import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/core/models/book_model/item.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You can also view', style: Styles.textStyle18),
        const SizedBox(height: 7),
        SimilarBooksListView(book: book),
      ],
    );
  }
}
