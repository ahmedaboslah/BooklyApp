import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/Errors/Failers.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failers,List<BookModel>>> fetchNewSetBooks();
  Future<Either<Failers,List<BookModel>>> fetchFeatuerBooks();
  Future<Either<Failers,List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failers,List<BookModel>>> fetchSearchBooks();
}