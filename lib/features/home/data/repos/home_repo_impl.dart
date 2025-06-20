import 'package:book_store_app/core/errors/failure.dart';
import 'package:book_store_app/core/utils/api_service.dart';
import 'package:book_store_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      final data = await apiService.get(
        endPoint:
            'volumes?q=subject:novels&Filtering=free-ebooks&Sorting=newest',
      );
      final List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(item);
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
