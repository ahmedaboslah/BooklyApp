part of 'new_set_books_cubit.dart';

abstract class NewSetBooksState extends Equatable {
  const NewSetBooksState();

  @override
  List<Object> get props => [];
}

class NewSetBooksInitial extends NewSetBooksState {}
class NewSetBooksLoading extends NewSetBooksState {}
class NewSetBooksSuccess extends NewSetBooksState {
  final List<BookModel> Books;

  const NewSetBooksSuccess(this.Books);

}
class NewSetBooksFailure extends NewSetBooksState {
  final String errmessage;

  const NewSetBooksFailure(this.errmessage);

}
