import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/Repos/Home_repo.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/Errors/Failers.dart';
import 'package:equatable/equatable.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());
  final HomeRepo homeRepo;

  Future<void> fetchsimilar({required String category}) async {
    emit(SimilarBookLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarBookFailure(failure.ErrMessage)),
      (book) => emit(
        SimilarBookSuccess(book),
      ),
    );
  }
}
