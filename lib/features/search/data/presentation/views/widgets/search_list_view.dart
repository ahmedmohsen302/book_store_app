import 'package:book_store_app/core/widgets/custom_error.dart';
import 'package:book_store_app/core/widgets/custom_indicator.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/newest_books_item.dart';
import 'package:book_store_app/features/search/data/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Center(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BookItem(book: state.books[index]),
                );
              },
            ),
          );
        } else if (state is SearchFailure) {
          return CustomError(error: state.error);
        } else {
          return CustomIndicator();
        }
      },
    );
  }
}
