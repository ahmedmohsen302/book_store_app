import 'package:book_store_app/core/utils/functions/url_launcher.dart';
import 'package:book_store_app/core/widgets/custom_button.dart';
import 'package:book_store_app/features/home/data/models/book_model/item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});
  final Item book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'free',
              textColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomUrl(context, book.volumeInfo.previewLink!);
              },
              text: 'Free preview',
              textColor: Colors.white,
              backgroundColor: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
