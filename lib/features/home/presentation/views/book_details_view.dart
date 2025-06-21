import 'package:book_store_app/core/models/book_model/item.dart';
import 'package:book_store_app/features/home/presentation/view_models/similar_books/similar_books_cubit.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_detail_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final Item book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(
      context,
    ).fetchSimilarBooks(category: widget.book.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailBody(book: widget.book)),
    );
  }
}
