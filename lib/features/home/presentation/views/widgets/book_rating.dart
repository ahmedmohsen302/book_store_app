import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite, color: Colors.red),
        const SizedBox(width: 5),
        Text('4.8', style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text('(245)', style: Styles.textStyle14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
