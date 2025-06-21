import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/core/models/book_model/item.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);
        },
        child: Row(
          children: [
            Hero(
              tag: book.volumeInfo.imageLinks.thumbnail,
              child: BookImage(imageUrl: book.volumeInfo.imageLinks.thumbnail),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.volumeInfo.title ?? '',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.volumeInfo.authors?[0] ?? '',
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'free',
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BookRating(
                        count: book.volumeInfo.pageCount ?? 0,
                        rating: book.volumeInfo.averageRating ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
