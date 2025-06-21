import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/newest_books_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BookItem(),
        );
      },
    );
  }
}
