import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/models/book_model/item.dart';
import 'package:book_store_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;
  Future<void> search({required String category}) async {
    emit(SearchLoading());
    final result = await homeRepo.searchBooks(category: category);
    result.fold(
      (failure) {
        emit(SearchFailure(failure.error));
      },
      (books) {
        emit(SearchSuccess(books));
      },
    );
  }
}
