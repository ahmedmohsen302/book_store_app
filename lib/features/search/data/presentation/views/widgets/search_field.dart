import 'package:book_store_app/features/search/data/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        context.read<SearchCubit>().search(category: query.trim());
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Search',
        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ),
    );
  }
}
