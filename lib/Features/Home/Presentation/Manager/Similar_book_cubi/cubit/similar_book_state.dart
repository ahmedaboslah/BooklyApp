part of 'similar_book_cubit.dart';

abstract class SimilarBookState extends Equatable {
  const SimilarBookState();

  @override
  List<Object> get props => [];
}

class SimilarBookInitial extends SimilarBookState {}
class SimilarBookLoading extends SimilarBookState {}
class SimilarBookSuccess extends SimilarBookState {
  final List<BookModel> books;

  SimilarBookSuccess(this.books);
}
class SimilarBookFailure extends SimilarBookState {
  final String errmessage;

  SimilarBookFailure(this.errmessage);
}