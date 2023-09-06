import 'package:bookly/Features/Home/Presentation/Manager/Seacrh_Cubit/cubit/search_book_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Util/Style.dart';
import '../../../../Home/Presentation/View/widget/Best_Siller_ListView.dart';
import '../../../../Home/Presentation/View/widget/Circle_progress_indicator.dart';
import '../../../../Home/Presentation/View/widget/Custom_error_widget.dart';
import 'Custom_search_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: const [
          CustomeSearchBar(),
           SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Result",
              style: Style.TextStyle18,
            ),
          ),
          Expanded(child: SearchLisItem()),
        ],
      ),
    );
  }
}

class SearchLisItem extends StatelessWidget {
  const SearchLisItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookSuccess) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CircleProgresIndicator();
        }
      },
    );
  }
}
