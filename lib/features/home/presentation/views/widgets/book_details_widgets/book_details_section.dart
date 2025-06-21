import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_actions.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: BookImage(imageUrl: 'https://via.placeholder.com/150'),
        ),
        const SizedBox(height: 30),
        Text(
          'Harry Potter',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Opacity(
          opacity: .7,
          child: Text('J.K.Rowling', style: Styles.textStyle18),
        ),
        const SizedBox(height: 10),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          count: 0,
          rating: 0,
        ),
        const SizedBox(height: 30),
        BookActions(),
      ],
    );
  }
}
