import 'package:bookly/Features/Home/Presentation/View/widget/Custom_List_Item.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Manager/cubit/featured_book_cubit_cubit.dart';
import 'Circle_progress_indicator.dart';

class Custom_List_View extends StatelessWidget {
  const Custom_List_View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubitCubit, FeaturedBookCubitState>(
      builder: (context, state) {
        if (state is FeaturedBookCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: (() {
                      GoRouter.of(context).push('/Book_details_view',extra: state.books[index]);
                    }),
                    child: CustomListViewItem(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                    ),
                  ),
                );
              },
            ),
          );
        }else if(state is FeaturedBookCubitFailer){
          return CustomErrorWidget(errMessage: state.errmessage);
        }
        else{
          return const CircleProgresIndicator();
          // return SizedBox(
          //   height: MediaQuery.of(context).size.height * .3,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (BuildContext context, int index) {
          //       return const Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 8),
          //         child: CustomListViewItem(),
          //       );
          //     },
          //   ),
          // );
        }
      },
    );
  }
}
