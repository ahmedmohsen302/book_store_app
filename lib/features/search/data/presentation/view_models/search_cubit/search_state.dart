part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String error;

  const SearchFailure(this.error);
}

final class SearchSuccess extends SearchState {
  final List<Item> books;

  const SearchSuccess(this.books);
}
