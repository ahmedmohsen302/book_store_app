import 'package:book_store_app/core/widgets/custom_error.dart';
import 'package:book_store_app/core/widgets/custom_indicator.dart';
import 'package:book_store_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooktState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .28,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: BookImage(),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomError(error: state.error);
        } else {
          return CustomIndicator();
        }
      },
    );
  }
}
