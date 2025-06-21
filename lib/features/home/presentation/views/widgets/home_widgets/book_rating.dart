import 'package:book_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.count,
    required this.rating,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num count;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(Icons.favorite, color: Colors.red),
        const SizedBox(width: 5),
        Text(rating.round().toString(), style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text(
          '($count)',
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
