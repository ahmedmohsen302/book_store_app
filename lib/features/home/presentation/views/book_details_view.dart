import 'package:book_store_app/features/home/presentation/views/widgets/book_details_widgets/book_detail_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const BookDetailBody()));
  }
}
