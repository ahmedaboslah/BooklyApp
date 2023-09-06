import 'package:bookly/core/Util/Api_services.dart';
import 'package:dartz/dartz.dart';

import 'package:bookly/core/Errors/Failers.dart';

import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:dio/dio.dart';

import 'Home_repo.dart';

class HomeRepoImplementaion implements HomeRepo {
  final ApiService apiService;
  HomeRepoImplementaion(this.apiService);
  @override
  Future<Either<Failers, List<BookModel>>> fetchNewSetBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=Programming');
      List<BookModel> Books = [];
      for (var item in data['items']) {
        try {
          Books.add(BookModel.fromJson(item));
        } on Exception catch (e) {
          // TODO
        }
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailers.fromDioError(e));
      }
      return left(ServerFailers(e.toString()));
    }
  }

  @override
  Future<Either<Failers, List<BookModel>>> fetchFeatuerBooks() async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> Books = [];
      for (var item in data['items']) {
        Books.add(BookModel.fromJson(item));
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailers.fromDioError(e));
      }
      return left(ServerFailers(e.toString()));
    }
  }

  @override
  Future<Either<Failers, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<BookModel> Books = [];
      for (var item in data['items']) {
        Books.add(BookModel.fromJson(item));
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailers.fromDioError(e));
      }
      return left(ServerFailers(e.toString()));
    }
  }

  @override
  Future<Either<Failers, List<BookModel>>> fetchSearchBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<BookModel> Books = [];
      for (var item in data['items']) {
        Books.add(BookModel.fromJson(item));
      }
      return right(Books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailers.fromDioError(e));
      }
      return left(ServerFailers(e.toString()));
    }
  }
}
