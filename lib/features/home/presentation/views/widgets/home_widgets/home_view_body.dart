import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/newest_books_list_view.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/custom_app_bar.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/home_widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: FeaturedListView(),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text('Newest books', style: Styles.textStyle18),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}
