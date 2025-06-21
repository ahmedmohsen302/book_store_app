import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => Icon(Icons.error_outline),
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
