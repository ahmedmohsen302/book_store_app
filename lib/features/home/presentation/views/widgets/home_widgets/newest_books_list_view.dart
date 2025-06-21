import 'package:book_store_app/core/widgets/custom_error.dart';
import 'package:book_store_app/core/widgets/custom_indicator.dart';
import 'package:book_store_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/newest_books_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.book.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BookItem(book: state.book[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomError(error: state.error);
        } else {
          return const CustomIndicator();
        }
      },
    );
  }
}
