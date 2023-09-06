import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/Repos/Home_repo.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_cubit_state.dart';

class FeaturedBookCubitCubit extends Cubit<FeaturedBookCubitState> {
  FeaturedBookCubitCubit(this.homeRepo) : super(FeaturedBookCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async{
    emit(FeaturedBookCubitLoading());
    var result = await homeRepo.fetchFeatuerBooks();
    result.fold((Failer) => {
      emit(FeaturedBookCubitFailer(Failer.ErrMessage))
    }, (books) => {
      emit(FeaturedBookCubitSuccess(books))
    });
    
  }
}
