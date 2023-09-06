part of 'search_book_cubit.dart';

abstract class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

class SearchBookInitial extends SearchBookState {}
class SearchBookloading extends SearchBookState {}
class SearchBookSuccess extends SearchBookState {
  final List<BookModel> books;

  SearchBookSuccess(this.books);
}
class SearchBookFailure extends SearchBookState {
  final String errMessage;

  SearchBookFailure(this.errMessage);
}
