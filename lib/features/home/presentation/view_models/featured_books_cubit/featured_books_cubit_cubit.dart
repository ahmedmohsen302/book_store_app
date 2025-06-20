import 'package:bloc/bloc.dart';
import 'package:book_store_app/features/home/data/models/book_model/item.dart';
import 'package:book_store_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubitCubit(this.homeRepo) : super(FeaturedBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksCubitLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksCubitFailure(failure.error));
      },
      (books) {
        emit(FeaturedBooksCubitSuccess(books));
      },
    );
  }
}
