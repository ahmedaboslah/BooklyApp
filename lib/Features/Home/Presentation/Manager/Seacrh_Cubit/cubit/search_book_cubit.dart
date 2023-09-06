import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/Repos/Home_repo.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepo) : super(SearchBookInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSearch() async {
    emit(SearchBookloading());
    var result = await homeRepo.fetchSearchBooks();
    result.fold(
      (failure) => emit(SearchBookFailure(failure.ErrMessage)),
      (book) => emit(
        SearchBookSuccess(book),
      ),
    );
  }
}
