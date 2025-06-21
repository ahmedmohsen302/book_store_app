import 'package:bloc/bloc.dart';
import 'package:book_store_app/features/home/data/models/book_model/item.dart';
import 'package:book_store_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooktState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.error));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
