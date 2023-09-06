part of 'featured_book_cubit_cubit.dart';

abstract class FeaturedBookCubitState extends Equatable {
  const FeaturedBookCubitState();

  @override
  List<Object> get props => [];
}

class FeaturedBookCubitInitial extends FeaturedBookCubitState {}
class FeaturedBookCubitLoading extends FeaturedBookCubitState {}
class FeaturedBookCubitSuccess extends FeaturedBookCubitState {
  final List<BookModel> books;

  const FeaturedBookCubitSuccess(this.books);
}
class FeaturedBookCubitFailer extends FeaturedBookCubitState {
  final String errmessage;

  const FeaturedBookCubitFailer(this.errmessage);
}