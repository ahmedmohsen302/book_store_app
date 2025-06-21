import 'package:book_store_app/core/errors/failure.dart';
import 'package:book_store_app/core/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Item>>> fetchNewestBooks();
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({
    required String category,
  });
  Future<Either<Failure, List<Item>>> searchBooks({required String category});
}
