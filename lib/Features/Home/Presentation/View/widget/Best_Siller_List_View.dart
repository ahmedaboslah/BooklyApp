import 'package:bookly/Features/Home/Presentation/Manager/Newset/cubit/new_set_books_cubit.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Best_Siller_ListView.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Circle_progress_indicator.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewSetBooksCubit, NewSetBooksState>(
        builder: (context, state) {
      if (state is NewSetBooksSuccess) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.Books.length,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding:const EdgeInsets.symmetric(vertical: 10),
              child: BestSellerListViewItem(
                bookModel: state.Books[index],
              ),
            );
          },
        );
      }
      else if(state is NewSetBooksFailure){
        return CustomErrorWidget(errMessage: state.errmessage);
      }
      else{
        return const CircleProgresIndicator();
      }
    });
  }
}
