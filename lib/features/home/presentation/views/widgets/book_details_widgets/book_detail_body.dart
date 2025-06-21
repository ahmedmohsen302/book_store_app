import 'package:book_store_app/features/home/data/models/book_model/item.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_detail_app_bar.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_details_section.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailBody extends StatelessWidget {
  const BookDetailBody({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BookDetailAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: BookDetailsSection(book: book)),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimilarBooksSection(book: book),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
