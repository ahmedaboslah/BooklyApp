import 'package:bookly/Features/Home/Presentation/Manager/Similar_book_cubi/cubit/similar_book_cubit.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Circle_progress_indicator.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Custom_List_Item.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .2,
    child: ListView.builder(
      itemCount: state.books.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return  Padding(
          padding:const EdgeInsets.symmetric(horizontal: 8),
          child: CustomListViewItem(
            imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        );
      },
    ),
  );
}else if(state is SimilarBookFailure){
  return CustomErrorWidget(errMessage: state.errmessage);
}else{
  return CircleProgresIndicator();
}
      },
    );
  }
}
