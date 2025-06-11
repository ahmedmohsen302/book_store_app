import 'package:book_store_app/core/utils/styles.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book_store_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedListView(),
          SizedBox(height: 50),
          Text('Best Seller', style: Styles.textStyle18),
          const SizedBox(height: 18),
          BestSellerItem(),
        ],
      ),
    );
  }
}
