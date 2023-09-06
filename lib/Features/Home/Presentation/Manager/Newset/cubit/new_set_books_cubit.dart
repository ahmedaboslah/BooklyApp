

import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/Repos/Home_repo.dart';
import '../../cubit/featured_book_cubit_cubit.dart';

part 'new_set_books_state.dart';

class NewSetBooksCubit extends Cubit<NewSetBooksState> {
  NewSetBooksCubit(this.homeRepo) : super(NewSetBooksInitial());
   final HomeRepo homeRepo;
  Future<void> fetchNewSetBooks() async{
    emit(NewSetBooksLoading());
    var result = await homeRepo.fetchNewSetBooks();
    result.fold((Failer) => {
      emit(NewSetBooksFailure(Failer.ErrMessage))
    }, (books) => {
      emit(NewSetBooksSuccess(books))
    });
    
  }

}
