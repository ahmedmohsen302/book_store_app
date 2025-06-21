import 'package:book_store_app/core/errors/failure.dart';
import 'package:book_store_app/core/utils/api_service.dart';
import 'package:book_store_app/core/models/book_model/book_model.dart';
import 'package:book_store_app/core/models/book_model/item.dart';
import 'package:book_store_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> fetchNewestBooks() async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?q=novels&Filtering=free-ebooks&Sorting=newest',
      );
      final bookModel = BookModel.fromJson(data);
      final items = bookModel.items ?? [];
      return right(items);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?q=subject:novels&Filtering=free-ebooks',
      );
      final bookModel = BookModel.fromJson(data);
      final items = bookModel.items ?? [];
      return right(items);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?q=Filtering=free-ebooks&Sorting=relevance',
      );
      final bookModel = BookModel.fromJson(data);
      final items = bookModel.items ?? [];
      return right(items);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> searchBooks({
    required String category,
  }) async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?q=subject:$category&Filtering=free-ebooks',
      );
      final bookModel = BookModel.fromJson(data);
      final items = bookModel.items ?? [];
      return right(items);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
