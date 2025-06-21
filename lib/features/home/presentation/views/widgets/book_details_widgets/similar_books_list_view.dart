import 'package:book_store_app/core/widgets/custom_error.dart';
import 'package:book_store_app/core/widgets/custom_indicator.dart';
import 'package:book_store_app/core/models/book_model/item.dart';
import 'package:book_store_app/features/home/presentation/view_models/similar_books/similar_books_cubit.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.book.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: BookImage(
                    imageUrl: state.book[index].volumeInfo.imageLinks.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomError(error: state.error);
        } else {
          return CustomIndicator();
        }
      },
    );
  }
}
