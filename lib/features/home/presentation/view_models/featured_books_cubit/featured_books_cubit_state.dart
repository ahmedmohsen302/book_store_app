part of 'featured_books_cubit_cubit.dart';

sealed class FeaturedBooktState extends Equatable {
  const FeaturedBooktState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooktState {}

final class FeaturedBooksLoading extends FeaturedBooktState {}

final class FeaturedBooksFailure extends FeaturedBooktState {
  final String error;

  const FeaturedBooksFailure(this.error);
}

final class FeaturedBooksSuccess extends FeaturedBooktState {
  final List<Item> books;

  const FeaturedBooksSuccess(this.books);
}
