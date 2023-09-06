import 'package:bookly/Features/Home/Presentation/View/widget/Books_rating.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_Button.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_List_Item.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/custome_appBar2.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/Util/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Book_action.dart';
import 'Book_list_view_item.dart';

class BookDetailViewItem extends StatelessWidget {
  const BookDetailViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const customApBar(),
                 BookPicDetails(bookModel: bookModel,),
                const SizedBox(
                  height: 18,
                ),
                 BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  Rating: bookModel.volumeInfo.averageRating ?? 0,
                  count: bookModel.volumeInfo.ratingsCount??0,
                ),
                const SizedBox(
                  height: 37,
                ),
                 BookActionButton(bookModel:  bookModel,),
                const SizedBox(
                  height: 50,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: Style.TextStyle14.copyWith(
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  height: 16,
                ),
                const BookListView(),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BookPicDetails extends StatelessWidget {
  const BookPicDetails({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child:  CustomListViewItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',),
        ),
        const SizedBox(
          height: 43,
        ),
         Text(
          bookModel.volumeInfo.title!,
          style: Style.TextStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Style.TextStyle18.copyWith(
                fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }
}
