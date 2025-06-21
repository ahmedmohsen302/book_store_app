part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<Item> book;

  const SimilarBooksSuccess(this.book);
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String error;

  const SimilarBooksFailure(this.error);
}
