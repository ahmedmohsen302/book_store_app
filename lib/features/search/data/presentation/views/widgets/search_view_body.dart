import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/search/data/presentation/views/widgets/search_field.dart';
import 'package:book_store_app/features/search/data/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SearchField(),
            const SizedBox(height: 20),
            Text('Search results', style: Styles.textStyle18),
            const SizedBox(height: 10),
            SearchListView(),
          ],
        ),
      ),
    );
  }
}
