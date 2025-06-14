import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_detail_app_bar.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_details_section.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailBody extends StatelessWidget {
  const BookDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        slivers: const [
          SliverToBoxAdapter(child: BookDetailAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: BookDetailsSection()),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SimilarBooksSection(), SizedBox(height: 15)],
            ),
          ),
        ],
      ),
    );
  }
}
